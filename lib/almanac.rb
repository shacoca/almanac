require_relative "../config/environment.rb"

module Almanac

  class Almanac
 
    attr_accessor :site, :pubdate, :issue, :closed

    def initialize(main_site)
      @site = Scraper.scrape_main_site(main_site)
      @closed = false
      # @pubdate = pubdate:
      # @issue = issue:
    end

    def welcome
      puts "\e[2J"
      pause_unit = 0.13 * 3
      puts "\n\n#{@site.css("h1").text}\n"
      foot = @site.css("div#footerinfo").text.partition("P.")
      puts "#{foot.first}\n#{foot[1]}#{foot.last}\n\n"
      sleep (pause_unit * 4)

      puts "Today is #{@site.css("h2.pane-title.block-title a")[0].text}"
      sleep (pause_unit * 2)
      puts @site.css("p#calendar_dayofyear").text
      sleep (pause_unit * 2)
      puts @site.css("p#calendar_next_season").text

      sleep (pause_unit * 4)

      # run

    end

    def featured
      @site.css("div.view").each {|i| i.css("a h2").text}
    end

    def menu
      main_menu
      section_menu
    end
    
    def main_menu

      puts "\n\n\e[1m    Today's Companion\e[22m\n"

      featured.each_with_index do |f, i|
        puts "\n\e[1m#{i+1}. #{f.css("h2").text}\e[22m\n#{f.css("div.news-field-body").text}\n\n" if f.css("h2").text.length > 0
        sleep (0.3)
      end

    end

    def section_menu
      puts "\n    \e[4mSECTIONS\e[0m\n\n"
      sections = Scraper.scrape_sections(@site)
      sections.each_with_index do |sec_name, i|
        puts "#{i + featured.count}. #{sec_name.text}\n" unless sec_name.text == sections[-1].text
      end
    end

    def choose
      num_features = num_features || @site.css("div.view a h2").count
      print "\n\e[1mEnter a number\e[22m to read a feature from Today's Companion above or browse a section. (0 to exit) "

      user_input = gets.strip
      puts "\nYou chose #{user_input}.\n"
      user_input.to_i == nil ? oops(user_input) : choice = user_input.to_i - 1

      if choice >= 0 && choice < num_features
        url = featured[choice].css("a").last.attr("href")
        puts "Now fetching #{url}"
        display_feature(url)

      elsif choice >= num_features && choice <= num_features + 1 + sections.length
        display_selected_section_fp_menu(sections[choice - num_features])
      elsif choice < 0
        close_the_almanac
      else
        oops(user_input)
      end
    end

    def oops(wrong)
      puts "#{wrong}??"
      puts "Sorry, buddy. I don't know what you're talkin about."
      choose
    end

    # def section_front_page_menu
    #   section = Scraper.scrape_section(section_url)
    #   section.each_with_index do |el, i|
    #     puts "#{i.to_s + 1}. #{el.css("h2").text}\n" # unless el.text == section[-1].text
    #   end
    # end

    def display_feature(url_ext)
      f = get_feature(url_ext) #=> Nokogiri object returned
      feature_container = parse_feature(f)

      puts "\n\n\n\e[7h"

      puts feature_container
      
      puts "\n\n"
    end

    def get_feature(url_ext)
      Scraper.scrape_feature(url_ext) #=> returns feature
    end
  
    def parse_feature(feature)
      parsed = feature.css("p").text.split("Submitted by ").first
      # returns String
      # strips all text after main article, after first "Submitted by ".
      # strips "GET A COPY"
      # indents lines starting with ("Credit", "Photo Credit", "Image")
      new_lines = ""
      parsed.each_line do |l|
        new_lines << l.gsub("GET A COPY!", "\n").gsub("Image: ", "\n    Image: \n").gsub("Photo Credit: ", "\n    Photo Credit: \n").gsub("Credit", "\n   Credit: \n") + ("\n")

      end
      new_lines
    end

    def sections
      @site.css("div ul#superfish-1 li a.sf-depth-1")
    end

    def display_selected_section_fp_menu(section)
      fp = Scraper.scrape_section(section.attr("href"))
      sec_pcs = fp.css("div.view-content div a").reject{|i| i.css("h2").text == ""}
      sec_pcs.each_with_index{|el, i| puts "#{i + 1}. #{el.css("h2").text}"}
      print "\nEnter a number: "
      user_input = gets.strip
      user_input.to_i ? choice = user_input.to_i - 1 : oops(user_input)
      choice < sec_pcs.length ? display_feature(fp.css("div.view-content div a")[choice].attr("href"))
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