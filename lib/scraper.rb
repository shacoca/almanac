require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site, :section_front
    
    def self.scrape_main_site
        @main_site =  Nokogiri::HTML(open(SITE))
    end

    def self.scrape_section_front(section_url_caboose)
        @section_front = Nokogiri::HTML(open("#{main_site}/#{section_url_caboose}"))
    end

    def self.get_piece_title
    end

    def self.get_piece_subhead
    end

    def self.get_piece_section
    end

    def self.get_piece_pubdate
    end

    def self.get_piece_url
    end

    def self.get_piece_text
        Nokogiri::HTML(open(url.css().text)) #does this work?
    end

end