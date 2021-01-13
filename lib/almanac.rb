require_relative "../config/environment.rb"

module Almanac
  # Your code goes here...

  class Almanac
 
    attr_accessor :site, :pubdate, :issue

    def initialize(main_site)
      @site = Scraper.scrape_main_site
    end

    def welcome
      # site = Scraper.new.get_front_page
      pause_unit = 0.2
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

    end

    def featured
      @site.css("div.view").each {|i| i.css("a h2").text}
    end

    def main_menu
      # display Today's Companion (1-5)
      # featured = @site.css("div.view").each {|i| i.css("a h2").text}

      puts "\n\n\e[1m    Today's Companion\e[22m\n"

      # featured.each_with_index{|f, i| puts "#{i+1}. #{f}" if f}
      featured.each_with_index do |f, i|
        puts "\n\e[1m#{i+1}. #{f.css("h2").text}\e[22m\n#{f.css("div.news-field-body").text}\n\n" if f.css("h2").text.length > 0
        sleep (0.3)
      end

      puts "\n\e[1mEnter a number\e[22m to read a feature from Today's Companion above or browse a section below.: "

      # section menu (6-??)
      
      # featured.each_with_index do |f, i|
      #   puts "\n\e[1m#{i+1}. #{f.css("h2").text}\e[22m\n#{f.css("div.news-field-body").text}\n" if f.css("h2").text.length > 0
      #   sleep (pause_unit * 1.4)
    end

    def section_menu
      puts "\n    \e[1mSECTIONS\e[22m\n"
      sections = Scraper.get_piece_sections
      sections.each_with_index do |sec_name, i|
        puts "#{featured.count + i}. #{sec_name.text}\n#{sec_name.css("div.news-field-body").text}\n" unless sec_name.text == sections[-1].text
      end
    end

    def weather_menu
    end

    def more_menu
    end

    def input
            
      user_input = gets.strip
      puts "You chose #{user_input}."
      user_input.to_i == nil ? input : choice = user_input.to_i

      if choice >= 1 && choice <= @site.css("div.view a h2").count
        # fetch featured[choice]
        puts "Hey, that's a feature! Good for you!"

      elsif choice > @site.css("div.view a h2").count
        # fetch section headlines
          # form url
          
        # display section menu
        puts "Well, lemme go get that section for ya!"

    #   when 2
    #   when 3
    #   when 4
      # when 5
      else
        puts "#{user_input}??"
        puts "Sorry, buddy. I don't know what you're talkin about."
      end
    end

    def run
      welcome
      main_menu
      section_menu
      input
      get_feature_or_section_front_page
      display_feature or display_selected_section_menu

    end
  
    def get_feature_or_section_front_page
      
    end

    def display_feature
    end

    def display_selected_section_menu
    end
    
    

  end



end
