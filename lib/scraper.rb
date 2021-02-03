require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site, :piece_page

    def self.scrape_main_site(url)
        @main_site = Nokogiri::HTML(open(url))
    end

    def self.scrape_features
        features = []
        @main_site.css("div .view-display-id-block_8").each do |f|
            # piece_hash = {
            #     title: f.css(".news-field-block-title").text,
            #     subhead: f.css("div.news-field-body").text.split("\n").first,
            url = f.css("div.news-wrapper a")[1].attr("href")
            #     section: f.css("div.news-wrapper a")[0].text.capitalize,
            #     pubdate: f.css(".news-field-node-date").text,
            #     text: "na na na na na na na na na na na na na na na na na na na"
            # }
            new_piece = scrape_piece(url)
            features << new_piece
        end
        features
    end

    def self.scrape_piece(url_ext)
        # return Piece
        nope = "nuffin here"
        piece_data = Nokogiri::HTML(open(SITE + url_ext))
        title = piece_data.css("h1").text ? piece_data.css("h1").text.strip : nope
        # author = piece_data.css("h2 ~ div.panel-pane div.block-content")[0].text.strip.gsub("By ", "")
        subhead = piece_data.css(".subhead").text.strip
        pubdate = piece_data.css("span[property='schema:dateModified']").attr('content').value
        author = piece_data.css('.pane-display-author').text.strip.gsub("By ", "")
        url = piece_data.css("span[property='schema:mainEntityOfPage']").attr('content').value
        text = piece_data.css(".field-item[property='schema:articleBody']")[0]
        # section = piece_data.css("")
        piece_hash = {
            title: title,
            pubdate: pubdate,
            author: author,
            url: url,
            text: text,
            subhead: subhead
            # section: section
        }
        Piece.new(piece_hash)        
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

    def print_text(text)
        # body_text = piece.css(".field-item[property='schema:articleBody']")[0]
        puts "\n\e[3m#{body_text.css("div#first-para-wrapper p").text}\e[0m\n"
        body_text.css("h2, h3, p, ul, ol, li").each do |line|
            case line.name
            when "h2"
                puts "\n\n      \e[1m#{line.text}\e[0m\n\n"
            when "h3"
                puts "\n  \e[1m\e[3m#{line.text}\e[0m"
            when "ol", "ul"
                puts "----- ----- -----"
            when "li"
                puts " -- #{line.text}"
            when "p"
                puts line.text
                puts "\n\n" if body_text.css("p:last-of-type").text == line.text
            end
        end
    end

end