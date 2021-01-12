require_relative "../config/environment.rb"

class Section
    attr_accessor :title
    attr_reader :url

    @@all = []

    def initialize(title, url)
        @title = title
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
        Pieces.all.select{|p| p.section == self}
    end

    def add_piece(piece)
        @pieces << piece unless @pieces.include?(piece)
        # piece.section = self unless piece.section
    end

    def self.new_from_piece(piece)
        Section.new(piece.title)
        # add_piece(piece)
    end

    def new_piece(piece)
        if pieces.include?(piece)
            add_piece
        else
        end

    end

    def self.count
        @@all.count
    end
end