require_relative "../config/environment.rb"

class Piece
    attr_accessor :title, :pubdate, :author, :url, :text, :subhead, :section

    @@all = []

    def initialize(piece_hash)
        add_piece_attributes(piece_hash)
        save
    end

    def self.get_features
        # returns array of Piece obs
        features = []
        Scraper.scrape_features.each{|piece_data| features << Piece.new(piece_data)}
        features
    end

    def save
        @@all << self
    end

    def add_piece_attributes(piece_hash)
        piece_hash.each{|key, value| self.send(("#{key}="), value)}
    end

    def self.all
        @@all
    end

    def self.count
        all.count
    end

end