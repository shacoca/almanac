require_relative "./piece.rb"

class Featured < Piece
    attr_accessor :section, :title, :subhead, :pubdate, :author

    @@all = []

    def initialize(feat_hash)
        @section = feat_hash[:section] # object
        @title   = feat_hash[:title] # String
        @subhead = feat_hash[:subhead] # String
        @pubdate = feat_hash[:pubdate] # String
        @author  = feat_hash[:author] # String
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

