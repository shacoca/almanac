require_relative "../config/environment.rb"

module Almanac

  class Issue
 
    attr_accessor :site, :sections, :features, :issue_date, :closed, :first_run # :pieces

    def initialize(url)
      scrape = Scraper.new(url)
      @site = scrape.main_site
      # @pieces = []
      @sections = scrape.get_sections
      @features = scrape.scrape_front_page #array of Piece obs
      @issue_date = site.css(".block-title a")[0].text
      @closed = false
      @first_run = true
    end

    def welcome
      puts "\n\n"
      pause_unit = 0.18
      puts "\n\n#{@site.css("h1").text}\n"
      foot = @site.css("div#footerinfo").text.partition("P.")
      puts "#{foot.first}\n#{foot[1]}#{foot.last}\n\n" # masthead info
      sleep (pause_unit * 4)

      puts "Today is #{@issue_date}"  # greeting
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
        sleep (0.3) if @first_run
      end

    end

    def section_menu
      puts "\n    \e[4mSECTIONS\e[0m\n\n"
      sections.each_with_index{|sec, i| puts "#{i + 1 + @features.count}. #{sec.name.capitalize}\n"}
    end

    def choose
      print "\n\e[1mEnter a number\e[22m to read a feature from Today's Companion or browse a section. (0 to exit) "

      user_input = gets.strip
      print "\nYou chose #{user_input}. "
      if user_input.to_i == nil
        oops(user_input)
      else
        choice = user_input.to_i - 1
      end

      if choice >= 0 && choice < @features.count
        @features[choice].print_text

      elsif choice >= @features.count && choice < @features.count + sections.count
        # puts "\n"
        puts ["Grabbing that section for ya..... ", "Hold on, I'll get that.....", "Just a moment while grab that.....", "OK. Just a sec.....", "Coming right up....."].sample
        puts "\n"
        display_selected_section_fp_menu(choice - @features.count)
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

    # def sections
    #   secs = @site.css("div ul#superfish-1 li a.sf-depth-1")
    #   secs.pop
    #   secs
    # end

    def display_selected_section_fp_menu(section)
      # binding.pry
      sec_pcs = sections[section].get_section_pieces
      # sec_pcs = fp.css("div.view-content div a").reject{|i| i.css("h2").text == ""}
      sec_pcs.each_with_index{|el, i| puts "#{i + 1}. #{el.title}"}
      print "\nEnter a number: "
      user_input = gets.strip
      user_input.to_i ? choice = user_input.to_i - 1 : oops(user_input)
      choice < sec_pcs.length ? display_piece(sec_pcs[choice])
       : oops(user_input)
    end

    def again?
      @first_run = false
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
    
  end

end