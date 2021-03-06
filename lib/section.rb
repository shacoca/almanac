require_relative "../config/environment.rb"

class Section
    attr_reader :name, :url

    @@all = []

    def initialize(name, url)
        @name = name
        @url = url
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def pieces
        Piece.all.select{|pc| pc.section == self}
    end

    def add_piece(piece)
        pieces << piece unless pieces.include?(piece)
        piece.section ||= self
    end

    def front_page #returns Noko ob
        Nokogiri::HTML(open(SITE + url))
    end
      
    def get_section_pieces
        scrape = Scraper.new(SITE)
        sec_pieces = []
        front_page.css("#block-system-main .block-content .view-content a").each do |pc|
            new_piece = scrape.scrape_piece(pc.attr("href"))
            sec_pieces << new_piece
            add_piece(new_piece)
        end
        sec_pieces
    end

    # def self.new_from_piece(piece)
    #     Section.new(piece.title, url)
    #     add_piece(piece)
    # end

    # def new_piece(piece)
    #     if !pieces.include?(piece)
    #         add_piece
    #     else

    #     end

    # end

    def self.find_or_create_from_url(url)
        if @all.find{|s| s.url == url}
           @all.find{|s| s.url == url}
        else
            self.new
        end
    end

    def self.count
        @@all.count
    end
end