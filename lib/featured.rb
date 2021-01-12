require_relative "./piece.rb"

class Featured < Piece
    attr_accessor :section, :title, :subhead

    def self.count
        all.count
    end


end