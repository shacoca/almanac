require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site

    def initialize(url)
        @main_site = Nokogiri::HTML(open(url))
    end

    def scrape_front_page
        fp_pieces = [] # arr of Piece obs

        @main_site.css("div .view-display-id-block_8").each { |f| fp_pieces << scrape_piece(f.css("div.news-wrapper a")[1].attr("href"))}
        # binding.pry
        fp_pieces
    end

    def scrape_piece(ext) # returns Piece
        piece_data = Nokogiri::HTML(open(SITE + ext)) # now determine article or recipe
        if ext.include?("/recipe/")# || ext.include?("-recipe-")
            pc_data = scrape_recipe(piece_data)
        else
            pc_data = scrape_article(piece_data)
        end

        Piece.find_or_create_piece(pc_data)
    end

    def scrape_article(piece_data)
        pc_data = {}
        pc_data[:title] = piece_data.css("h1").text.strip
        pc_data[:subhead] = piece_data.css("div[property='schema:alternativeHeadline']").text.strip
        if piece_data.css("span[property='schema:dateModified']").attr('content')
            pc_data[:pubdate] = date_parse(piece_data.css("span[property='schema:dateModified']").attr('content').value)
        end
        pc_data[:author] = piece_data.css('.pane-display-author').text.gsub("By ", "").strip
        if piece_data.css("span[property='schema:mainEntityOfPage']").attr('content')
            pc_data[:url] = piece_data.css("span[property='schema:mainEntityOfPage']").attr('content').value
        else
            pc_data[:url] = "https://www.almanac.com"
        end
        pc_data[:body_text] = piece_data.css("div[property='schema:articleBody'], div#article-feature")
        pc_data
    end

    def scrape_recipe(piece_data)
        pc_data = {}
        pc_data[:title] = piece_data.css("h1").text.strip
        pc_data[:pubdate] = date_parse(piece_data.css("meta[property='og:updated_time']").attr("content").value)
        pc_data[:author] = piece_data.css("li.field-item a")[-1].text
        pc_data[:url] = piece_data.css("meta[property='og:url']").attr("content").text
        pc_data[:body_text] = piece_data.css("section#main-content")
        pc_data[:subhead] = piece_data.css("div[property='schema:description'] p")[0].text.strip
        pc_data
    end

    def date_parse(raw_date)
        months = {
            "01"=>"January",
            "02"=>"February",
            "03"=>"March",
            "04"=>"April",
            "05"=>"May",
            "06"=>"June",
            "07"=>"July",
            "08"=>"August",
            "09"=>"September",
            "10"=>"October",
            "11"=>"November",
            "12"=>"December"
        }

        "#{months[raw_date.slice(5,2)]} #{raw_date.slice(8,2)}, #{raw_date.slice(0,4)}"
    end

    def get_sections
        sections = []
        secs = @main_site.css("div ul#superfish-1 li a.sf-depth-1")
        secs.pop
        secs.each{|u| sections << Section.new(u.attr("href").gsub("/", ""), u.attr("href"))}
        sections
    end

    def get_section_front(section)
        Nokogiri::HTML(open(SITE + section))
    end

    def get_section_pieces(section)
        Nokogiri::HTML(open(SITE + section))
    end

end