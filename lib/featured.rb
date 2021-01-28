require_relative "./piece.rb"

class Featured < Piece
    attr_accessor :section, :title, :subhead, :pubdate, :author

    @@all = []

    def initialize(url)
        @section = 
        @title = 
        @subhead = 
        @pubdate = 
        @author = 
        save
    end

    def save
        @all << self
    end

    def self.all
        @@all
    end

    def self.count
        all.count
    end


end

