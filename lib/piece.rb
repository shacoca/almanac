require_relative "../config/environment.rb"

class Piece
    attr_accessor :title, :subhead, :section, :pubdate, :author, :url, :text

    @@all = []

    def initialize(piece_hash)
        add_piece_attributes(piece_hash)
        save
    end

    def create_from_scrape(piece_hash = {title: "hhaaaaaaaaay!!", subhead: "wuddup?", section: "not_a_section_object", pubdate: Time.new.localtime.inspect, author: "Haywood Jackson", url: "404"})
        Piece.new(piece_hash)
    end

    def save
        @@all << self
    end

    def add_piece_attributes(piece_hash)
        # puts "adding attrs #{piece_hash.keys}"
        piece_hash.each{|key, value| self.send(("#{key}="), value)}
        # puts "#{piece_hash[:title]}"
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

    def print_title_and_subhead
        puts "\n\n\e[1m\e[4m#{@title}\e[0m\n"
        if @subhead == ""
            puts "\n\e[3m\e[7m==================\e[0m\n\n"
        else
            puts "\n\e[3m#{@subhead}\e[0m\n\n"
        end

        if @author == ""
            puts "\n\e[3m\e[7m==================\e[0m\n\n"
        else
            puts "\nby #{@author}\n\n"
        end
    end

end