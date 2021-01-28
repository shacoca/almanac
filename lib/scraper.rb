require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site

    def self.get_main_site(url)
        @main_site = Nokogiri::HTML(open(url))
        features = get_features
        sections = get_sections
        @main_site
    end

    def self.get_sections
        # this should return array of Section objects
        secs = []
        @main_site.css("div ul#superfish-1 li a.sf-depth-1").each do |u|
            if u.attr("href").start_with?("/")
                secs << Section.new(SITE + u.attr("href")) #if u.attr("href")
            end
        end
        secs
    end

    def self.get_features
        # this should return array of Featured objects
        features = []
        @main_site.css("div.view").pop.each do |i|
            # tap ?
            # pop the last item
            # features << Featured.new({
                # :section = get_section,
                # :title = ,
                # :subhead = ,
                # :pubdate = ,
                # :author = 
            # }) # unless i.css("a h2").text == ""
        end
        features
    end

    def self.get_feature(url_ext)
        get_piece(url_ext)
    end

    def self.get_section_front(section)
        Nokogiri::HTML(open(SITE + section.url))
    end

    def self.get_piece(url_ext)
        # return Piece
        
        piece_data = Nokogiri::HTML(open(SITE + "/" + url_ext))
        piece_hash = {
            title: piece_data.css("a h2").text, # String
            subhead: piece_data.css("div.news-field-body").text, # String
            section: Section.all.select{|s| s.name == piece_data.css("div h3").text}, # Section
            # section: piece_data.css("div h3").text, # Section
            pubdate: piece_data.css______, # String
            author: piece_data.css______, # String
            url: piece_data.css______, # String
            text: piece_data.css______ # String
    
        }
    end

    def self.get_piece_data(url)
        # piece_atts = {}
        piece = get_piece(url)
        piece_atts[:title] = piece.css("a h2").text # String
        piece_atts[:subhead] = piece.css("div.news-field-body").text # String
        piece_atts[:section] = Section.all.select{|s| s.name == piece.css("div h3").text} # Section
        # piece_atts[:section] = piece.css("div h3").text # Section
        piece_atts[:pubdate] = piece.css______ # String
        piece_atts[:author] = piece.css______ # String
        piece_atts[:url] = piece.css______ # String
        piece_atts[:text] = piece.css______ # String
        # piece_atts[:text] = Nokogiri::HTML(open(url.css().text)) #does this work?
    end

    # def self.get_piece_subhead(url)
    # end

    def self.get_piece_pubdate(url)
    end

    # def self.get_piece_url(url)
    # end

    # def self.get_piece_text(url)
    # end

#     hash = Hash.new
# %w(cat dog wombat).each_with_index {|item, index|
# hash[item] = index
# }
# hash   #=> {"cat"=>0, "dog"=>1, "wombat"=>2}

end

