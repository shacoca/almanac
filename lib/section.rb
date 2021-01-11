require_relative "../config/environment.rb"

class Section
    attr_accessor :title, :pieces

    @@pieces = []
    @@all = []

    def initialize(title)
        @title = title
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def pieces
        @@pieces
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