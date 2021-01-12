require_relative "../config/environment.rb"

class Piece
    attr_accessor :title, :subhead, :section, :pubdate, :url, :text

    @@all = []

    def initialize(piece_hash)
        add_piece_attributes(piece_hash)
        save
    end

    def create_from_scrape(piece_hash = {title: "hhaaaaaaaaay!!", subhead: "wuddup?", section: "not_a_section_object", pubdate: Time.new.localtime.inspect, url: "404"})
        Piece.new(piece_hash)
    end

    def save
        @@all << self
    end

    def add_piece_attributes(piece_hash)
        piece_hash.each {|key, value| self.send(("#{key}="), value)}
        self
    end

    def self.all
        @@all
    end

    def section=(section)
        @section = section
        section.new_piece(self)
    end

    def text=(url)
        Scraper.scrape_piece_text(url)
    end

    def self.count
        all.count
    end

end