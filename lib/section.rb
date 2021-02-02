require_relative "../config/environment.rb"

class Section
    attr_accessor :name
    attr_reader :url

    @@all = []

    def initialize(url)
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

    def url=(url)
        @url = url
    end

    def self.pieces
        Piece.all.select{|p| p.section == self}
    end

    def add_piece(piece)
        @pieces << piece unless @pieces.include?(piece)
        # piece.section = self unless piece.section
    end

    def self.new_from_piece(piece)
        Section.new(piece.name)
        # add_piece(piece)
    end

    def new_piece(piece)
        if Section.pieces.include?(piece)
            add_piece
        else
        end

    end

    def find_or_create_from_url
    end

    def self.count
        @@all.count
    end
end