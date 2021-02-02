require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site, :piece_page

    def self.scrape_main_site(url)
        @main_site = Nokogiri::HTML(open(url))
    end

    def self.scrape_features
        features = []
        @main_site.css("div .view-display-id-block_8").each do |f|
            piece_hash = {
                title: f.css(".news-field-block-title").text,
                subhead: f.css("div.news-field-body").text.split("\n").first,
                url: f.css("div.news-wrapper a")[1].attr("href"),
                section: f.css("div.news-wrapper a")[0].text.capitalize,
                pubdate: f.css(".news-field-node-date").text,
                text: "na na na na na na na na na na na na na na na na na na na"
            }
            features << piece_hash
        end
        features
    end

    def self.scrape_piece(url_ext)
        # return Piece
        nope = "nuffin here"
        piece_data = Nokogiri::HTML(open(SITE + url_ext))
        title = piece_data.css("h1").text ? piece_data.css("h1").text.strip : nope
        author = piece_data.css("h2 ~ div.panel-pane div.block-content")[0].text.strip.gsub("By ", "")
        # pubdate = piece_data.css("div.panel-pane div.block-content")[2] ? piece_data.css("div.panel-pane div.block-content")[2].text.strip : nope
        author = piece_data.css("div.panel-pane div.block-content a")[0] ? piece_data.css("div.panel-pane div.block-content a")[0].text.strip : nope
        url = SITE + url_ext
        text = nope
        subhead = piece_data.css("div.news-field-body") ? piece_data.css("div.news-field-body").text.split("\n").first : nope
        section = piece_data.css("div.news-wrapper a")[0] ? piece_data.css("div.news-wrapper a")[0].text.capitalize : nope
        piece_hash = {
            title: title,
            pubdate: pubdate,
            author: author,
            url: url,
            text: text,
            subhead: subhead,
            section: section
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

end