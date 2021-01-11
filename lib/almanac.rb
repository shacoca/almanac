require_relative "../config/environment.rb"

module Almanac
  # Your code goes here...

  class Almanac
 
    attr_accessor :site, :pubdate, :issue

    def initialize(main_site)
      @site = Scraper.main_site
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

    def main_menu
      # display Today's Companion (1-5)
      featured = @site.css("div.view").each {|i| i.css("a h2").text}

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

    # weather (wx menu)

    def section_menu
      puts "\n    \e[1mSECTIONS\e[22m\n"
      @site.css("div ul#superfish-1 li a.sf-depth-1").each_with_index do |sec_name, i|
        # @site.css("div ul#superfish-1 li a").each_with_index do |sec, i|
        puts "#{@site.css("div.view").count + i}. #{sec_name.text}\n#{sec_name.css("div.news-field-body").text}\n"

      end
    end

    def weather_menu
    end

    def more_menu
    end

    def input
            
      choice = gets.strip

      second = Piece.new(choice, "wicked pisser!")
      puts second.title
      puts second.section

    #   case choice
    #   when choice >= 1 && choice < 
    #     # fetch section headlines
    #       # form url
          
    #     # display section menu
    #   when 2
    #   when 3
    #   when 4
    #   when 5
    end

    def run
      welcome
      main_menu
      section_menu
      input  # get input/parse input
      # fetch piece, display piece
      
    end
  

  end



end
