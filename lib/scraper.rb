require_relative "../config/environment.rb"

class Scraper

    def self.scrape_main_site(main_site)
        Nokogiri::HTML(open(main_site))
    end

    def self.scrape_sections(site)
        site.css("div ul#superfish-1 li a.sf-depth-1")
    end

    def self.scrape_feature(url_ext)
        scrape_piece(url_ext)
    end

    def self.scrape_section(section_url)
        # binding.pry
        Nokogiri::HTML(open(SITE + section_url))
        # Nokogiri::HTML(open("#{SITE}#{section_url}"))
    end

    def self.scrape_piece(url_ext)
        Nokogiri::HTML(open(SITE + "/" + url_ext))
        # piece_site.css("div#content-column section#main-content")....
    end

    def self.get_piece_title
    end

    def self.get_piece_subhead
    end

    def self.get_piece_pubdate
    end

    def self.get_piece_url
    end

    def self.get_piece_text
        Nokogiri::HTML(open(url.css().text)) #does this work?
    end

end

