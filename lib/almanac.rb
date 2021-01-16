require_relative "../config/environment.rb"

module Almanac
  # Your code goes here...

  class Almanac
 
    attr_accessor :site, :pubdate, :issue

    def initialize(main_site)
      @site = Scraper.scrape_main_site(main_site)
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

      run

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

    def section_front_page_menu
      section = Scraper.scrape_section(section_url)
      section.each_with_index do |el, i|
        puts "#{i.to_s + 1}. #{el.css("h2").text}\n" # unless el.text == section[-1].text
      end
    end

    def choose
      num_features = @site.css("div.view a h2").count
      print "\n\e[1mEnter a number\e[22m to read a feature from Today's Companion above or browse a section. (0 to exit) "

      user_input = gets.strip
      puts "\nYou chose #{user_input}.\n"
      user_input.to_i == nil ? choice = input : choice = user_input.to_i - 1

      if choice >= 0 && choice < num_features
        display_feature("#{(featured[choice].css("a").last.attr("href"))}")

      elsif choice >= num_features
        display_selected_section_fp_menu(sections[choice])
      elsif choice == "0"
        close_the_almanac
      else
        puts "#{user_input}??"
        puts "Sorry, buddy. I don't know what you're talkin about."
        choose
      end
    end

    def display_feature(url_ext)
      f = get_feature(url_ext)
      feature_container = parse_feature(f)
      # TODO: get String from parse and fix the following code
      puts "\n\n\n\e[7h"
      feature_container.each do |line|
        if line.text.start_with?("Photo ")
          puts "    \e[3;4m#{line.text}\e[0m\n" #how you say italics?
        # elsif line.text.start_with?("GET")
        else
          by_url = @site + url_ext
          puts "#{line.text.gsub('GET A COPY!', 'from #{by_url}\n')}"
        end
      end
      puts "\n\n"
    end

    def get_feature(url_ext)
      Scraper.scrape_feature(url_ext) #=> returns feature
    end
  
    def parse_feature(feature)
      filter = "Submitted by "
      out_string = ""
      feature.css("p").each do |line|
        break if line.text.start_with?(filter)
        out_string += line.text
      end
      out_string
    end

    def sections
      @site.css("div ul#superfish-1 li a.sf-depth-1")
    end



    def display_selected_section_fp_menu(url)
      Scraper.scrape_section(url)

    end

    def again?
      print "Would you like to read another selection? (y or n): "
      y_or_n = gets.strip.upcase
      y_or_n == "Y" ? choose : close_the_almanac
    end

    def close_the_almanac
      puts "\n\n\n            May the sun bless your crops 'til we see you again. Bye now!\n\n\n\n"
    end
    
    def run
      # welcome
      menu
      choose
      again?
      # close_the_almanac
    end  

  end

end
