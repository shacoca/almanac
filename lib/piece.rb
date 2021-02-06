require_relative "../config/environment.rb"

class Piece
    attr_accessor :title, :pubdate, :author, :url, :text, :subhead # :section

    @@all = []

    def initialize(piece_hash)
        add_piece_attributes(piece_hash)
        save
    end

    def self.get_features
        # returns array of Piece obs
        features = []
        Scraper.scrape_features.each{|piece_data| features << piece_data}
        features
    end

    def self.get_section_pieces(url)
        Scraper.scrape_and_create_section_pieces(url)
        # section_pieces = []
        # Scraper.scrape_piece(url).each{|f| section_pieces << f}
        # section_pieces
    end

    def save
        @@all << self
    end

    def self.clear
        @@all.clear
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

    def print_text
        puts "\n\n\e[1m\e[4m#{@title}\e[0m\n"
        if @subhead == ""
            puts "\n\e[3mNo subhead, Chief.\e[0m\n\n"
        else
            puts "\n\e[3m#{@subhead}\e[0m\n\n"
        end
        @text.css("h2, h3, p, ul, ol, li").each do |line|
            case line.name
            when "h2"
                puts "\n\n      \e[1m#{line.text}\e[0m\n\n"
            when "h3"
                puts "\n\n  \e[1m\e[3m#{line.text}\e[0m"
            when "ol", "ul"
                puts "\n----- ----- -----\n"
            when "li:last-of-type"
                puts "  @ .. #{line.text}\n\n"
            when "li"
                puts "  @ .. #{line.text}"
            when "p:last-of-type"
                puts line.text
                puts "\n\n"
            when "p"
                puts line.text
            end
        end
        puts "\n\n"
    end
end