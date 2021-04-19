require_relative "../config/environment.rb"

class Piece
    attr_accessor :title, :pubdate, :author, :url, :body_text, :subhead, :featured
    attr_reader :section

    @@all = []

    def initialize(piece_hash)
        add_piece_attributes(piece_hash)
        save
    end

    def section=(sec)
        @section ||= sec
        sec.add_piece(self)
    end

    def save
        @@all << self
    end

    def self.clear
        @@all.clear
    end

    def self.find_or_create_piece(piece_hash)
        if self.all.find{|pc| pc.title == piece_hash[:title]}
            self.all.find{|pc| pc.title == piece_hash[:title]}
        else
            self.new(piece_hash)
        end
    end

    def add_piece_attributes(piece_hash)
        # puts "\nadding attrs #{piece_hash.keys}"
        piece_hash.each{|key, value| self.send(("#{key}="), value)}
        # puts "#{piece_hash[:title]}\n"
    end

    def self.all
        @@all
    end

    def self.count
        all.count
    end

    def print_recipe
        puts "\nINGREDIENTS"
        @body_text.css("div [property*='ingredients']").each{|n| puts n.text}
        puts "\nINSTRUCTIONS"
        grafs = @body_text.css("h2 + div.block-content p")
        grafs.pop
        grafs.each{|n| puts n.text}
        puts "\n\n"
    end

    def print_title_and_subhead
        puts "\n\n\e[1m\e[4m#{@title}\e[0m\n"
        if @subhead == ""
            puts "\n\e[3m\e[7m==================\e[0m\n\n"
        else
            puts "\n\e[3m#{@subhead}\e[0m\n\n"
        end
    end

    def print_text
        # puts "\e[2J"        # clear screen
        print_title_and_subhead
        no_print = ["Source", "WHAT DO YOU WANT TO READ NEXT?", "RELATED ARTICLES", "Share"]
        eof = false
        if @url.include?("recipe")
            print_recipe
        else
            @body_text.last.css("h2, h3, p, ul, ol, li").reject{|g| no_print.include?(g)}.each do |line|
                if line.text.include?("Source:")
                    eof = true
                elsif !eof
                    case line.name
                    # when "h2"
                    #     puts "\n\n      \e[1m#{line.text}\e[0m\n\n" unless line.text.include?("Share:")
                    when "h3"
                        puts "\n\n  \e[1m\e[3m#{line.text}\e[0m"
                    when "ol", "ul"
                        # puts "\n----- ----- -----\n"
                        puts "\n\n"
                    when "li:last-of-type"
                        puts " -\t#{line.text}\n\n"
                    when "li"
                        puts " -\t#{line.text}"
                    when "p:last-of-type"
                        puts line.text
                        puts "\n\n"
                    when "p"
                        puts line.text
                    end

                end
            end
        end
        puts "\n\n"
    end
end