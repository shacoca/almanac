require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site, :section_front, :piece

    def self.scrape_main_site(url)
        @main_site = Nokogiri::HTML(open(url))
        # features = get_features
        # sections = get_sections
    end

    def self.get_sections
        sec_urls = []
        @main_site.css("div ul#superfish-1 li a.sf-depth-1").each do |u|
            if u.attr("href").start_with?("/")
                sec_urls << u.attr("href")
            end
        end
        sec_urls
    end

    def self.get_features
        features = []
        @main_site.css("div.view").each {|i| features << i.css("a h2").text unless i.css("a h2").text == ""}
        features
    end

    def self.scrape_feature(url_ext)
        scrape_piece(url_ext)
    end

    def self.scrape_section(section_url)
        @section_front = Nokogiri::HTML(open(SITE + section_url))
    end

    def self.scrape_piece(url_ext)
        @piece = Nokogiri::HTML(open(SITE + "/" + url_ext))
    end

    def self.scrape_piece_data(url)
        piece_atts = {}
        piece = scrape_piece(url)
        piece_atts[:title] = piece.css("a h2").text # String
        piece_atts[:subhead] = piece.css("div.news-field-body").text # String
        piece_atts[:section] = scrape_piece(url).css("div h3").text # Section
        piece_atts[:pubdate] = piece.css______ # String
        piece_atts[:author] = piece.css______ # String
        piece_atts[:url] = piece.css______ # String
        piece_atts[:text] = Nokogiri::HTML(open(url.css().text)) #does this work?
    end

    # def self.scrape_piece_subhead(url)
    # end

    # def self.scrape_piece_pubdate(url)
    # end

    # def self.scrape_piece_url(url)
    # end

    # def self.scrape_piece_text(url)
    # end

#     hash = Hash.new
# %w(cat dog wombat).each_with_index {|item, index|
# hash[item] = index
# }
# hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}

end

