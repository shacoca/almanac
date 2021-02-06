require_relative "../config/environment.rb"

module Almanac

  class Almanac
 
    attr_accessor :site, :features, :pubdate, :closed

    def initialize(url)
      @site = Scraper.scrape_main_site(url)
      @features = Piece.get_features #array of Piece obs
      @closed = false
      @pubdate = site.css(".block-title a")[0].text
      # @issue = issue:
    end

    def welcome
      puts "\e[2J"        # clear screen
      pause_unit = 0.18
      puts "\n\n#{@site.css("h1").text}\n"
      foot = @site.css("div#footerinfo").text.partition("P.")
      puts "#{foot.first}\n#{foot[1]}#{foot.last}\n\n"        # masthead info
      sleep (pause_unit * 4)

      puts "Today is #{@pubdate}"        # greeting
      sleep (pause_unit * 2)
      puts @site.css("p#calendar_dayofyear").text
      sleep (pause_unit * 2)
      puts @site.css("p#calendar_next_season").text

      sleep (pause_unit * 3)

    end

    def menu
      main_menu
      section_menu
    end
    
    def main_menu

      puts "\n\n\e[1m    Today's Companion\e[22m\n"

      @features.each_with_index do |f, i|
        if f.subhead != ""          
          puts "\n  \e[1m#{i+1}. #{f.title}\e[22m\n#{f.subhead}\n\n"
        else
          puts "\n  \e[1m#{i+1}. #{f.title}\e[22m\n\n"
        end
        sleep (0.17)
      end

    end

    def section_menu
      puts "\n    \e[4mSECTIONS\e[0m\n\n"
      sections = Scraper.get_section_names
      sections.each_with_index do |sec_name, i|
        puts "#{i + 1 + features.count}. #{sec_name}\n"
      end
    end

    def choose
      print "\n\e[1mEnter a number\e[22m to read a feature from Today's Companion above or browse a section. (0 to exit) "

      user_input = gets.strip
      puts "\nYou chose #{user_input}.\n"
      if user_input.to_i == nil
        oops(user_input)
      else
        choice = user_input.to_i - 1
      end

      if choice >= 0 && choice < @features.count
        # url = featured[choice].css("a").last.attr("href")
        # puts "Please wait while we fetch #{url}......\n\n"
        @features[choice].print_text

      elsif choice >= features.count && choice <= features.count + 1 + sections.count
        display_selected_section_fp_menu(sections[choice - sections.count].attr("href"))
      elsif choice < 0
        close_the_almanac
      else
        oops(user_input)
      end
    end

    def oops(wrong)
      puts "\n#{wrong}?!?"
      puts "Sorry, farmer. I don't know what you're talkin' about.\n\n"
      choose
    end

    def display_piece(piece)
      piece.print_text
    end

    def parse_feature(feature)
      parsed = feature.css("p").text.split("Submitted by ").first
      new_lines = ""
      parsed.each_line do |l|
        new_lines << l.gsub("GET A COPY!", "\n").gsub("Image: ", "\n    Image: \n").gsub("Photo Credit: ", "\n    Photo Credit: \n").gsub("Credit", "\n   Credit: \n") + ("\n")

      end
      new_lines
    end

    def sections
      @site.css("div ul#superfish-1 li a.sf-depth-1")
    end

    def display_selected_section_fp_menu(section_url)
      sec_pcs = Piece.get_section_pieces(section_url)
      # binding.pry
      # sec_pcs = fp.css("div.view-content div a").reject{|i| i.css("h2").text == ""}
      sec_pcs.each_with_index{|el, i| puts "#{i + 1}. #{el.title}"}
      print "\nEnter a number: "
      user_input = gets.strip
      user_input.to_i ? choice = user_input.to_i - 1 : oops(user_input)
      choice < sec_pcs.length ? display_piece(sec_pcs[choice])
       : oops(user_input)
    end

    def again?
      print "Would you like to read another selection? (y or n): "
      y_or_n = gets.strip.upcase
      y_or_n == "Y" ? run : close_the_almanac
    end

    def close_the_almanac
      puts "\n\n\n            May the sun bless your crops 'til we see you again. Bye now!\n\n\n\n"
      @closed = true
    end

    def run
      menu
      choose
      again? if @closed == false
    end
    
    # def run
    #   # welcome
    #   menu
    #   choose  
    #   again?
    #   # close_the_almanac
    # end  

  end

end