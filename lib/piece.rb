require_relative "../config/environment.rb"

class Piece
    attr_accessor :title, :subhead, :section, :pubdate, :url, :featured

    @@all = []

    def initialize({title: "hhaaaaaaaaay!!", section: "add_your_section_today"}) #, subhead, section, pubdate, url)
        @title = title
        # @subhead = subhead
        @section = section
        # @pubdate = pubdate
        # @url = url

        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def section=(section)
        @section = section
        section.new_piece(self)
    end

    def self.count
        all.count
    end

end