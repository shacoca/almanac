require_relative "../config/environment.rb"

class Scraper
    # attr_accessor :main_site, :title, :pubdate, :author, :url, :body_text, :subhead

    def self.scrape_main_site(url)
        @main_site = Nokogiri::HTML(open(url))
    end

    def self.scrape_featured_pieces
        features = [] # arr of Piece obs
        @main_site.css("div .view-display-id-block_8").each {|f| features << scrape_piece(f.css("div.news-wrapper a")[1].attr("href"))}
        # binding.pry
        features
    end

    def self.scrape_piece(ext) # returns Piece
        # binding.pry
        # *******************************************************************
        piece_data = Nokogiri::HTML(open(SITE + ext)) # now determine article or recipe
        if ext.include?("/recipe/")# || ext.include?("-recipe-")
            scrape_recipe(piece_data)
        else
            scrape_article(piece_data)
        end

        Piece.find_or_create_piece({title: @title, pubdate: @pubdate, author: @author, url: @url, body_text: @body_text, subhead: @subhead})
    end

    def self.scrape_article(piece_data)

        @title = piece_data.css("h1").text.strip
        @subhead = piece_data.css("div[property='schema:alternativeHeadline']").text.strip
        if piece_data.css("span[property='schema:dateModified']").attr('content')
            @pubdate = date_parse(piece_data.css("span[property='schema:dateModified']").attr('content').value)
        end
        @author = piece_data.css('.pane-display-author').text.gsub("By ", "").strip
        if piece_data.css("span[property='schema:mainEntityOfPage']").attr('content')
            @url = piece_data.css("span[property='schema:mainEntityOfPage']").attr('content').value
        else
            @url = "https://www.almanac.com"
        end
        @body_text = piece_data.css("div[property='schema:articleBody'], div#article-feature")
    end

    def self.scrape_recipe(piece_data)
        @title = piece_data.css("h1").text.strip
        @pubdate = date_parse(piece_data.css("meta[property='og:updated_time']").attr("content").value)
        @author = piece_data.css("li.field-item a")[-1].text
        @url = piece_data.css("meta[property='og:url']").attr("content").text
        @body_text = piece_data.css("section#main-content")
        @subhead = piece_data.css("div[property='schema:description'] p")[0].text.strip
    end

    def self.date_parse(raw_date)
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

    def self.get_section_names
        secs = []
        @main_site.css("div ul#superfish-1 li a.sf-depth-1").each do |u|
            secs << u.attr("href").gsub("/", "").capitalize
            end
        secs.pop
        secs
    end

    def self.get_section_front(section)
        Nokogiri::HTML(open(SITE + section))
    end

        # *******************************************************************

    def self.scrape_and_create_section_pieces(sec_url)
        pieces = []
        page = get_section_front(sec_url)
        page.css("#block-system-main .block-content .view-content a").each{|u| pieces << scrape_piece(u.attr("href"))}
        pieces
    end

end