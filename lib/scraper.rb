require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site, :piece_page

    def self.scrape_main_site(url)
        @main_site = Nokogiri::HTML(open(url))
    end

    def self.scrape_features
        features = []
        @main_site.css("div .view-display-id-block_8").each {|f| features << scrape_piece(f.css("div.news-wrapper a")[1].attr("href"))}
        features
    end

    def self.scrape_piece(ext)
        # return Piece
        recipe = true if ext.include? "/recipe"
        piece_data = Nokogiri::HTML(open(SITE + ext))
        title = piece_data.css("h1").text ? piece_data.css("h1").text.strip : nope
        # author = piece_data.css("h2 ~ div.panel-pane div.block-content")[0].text.strip.gsub("By ", "")
        subhead = piece_data.css(".subhead").text.strip # div.field-item [property='schema:description']
        if piece_data.css("span[property='schema:dateModified']").attr('content')
            pubdate = piece_data.css("span[property='schema:dateModified']").attr('content').value
        else
            pubdate = "02-04-2020"
        end
        author = piece_data.css('.pane-display-author').text.gsub("By ", "").strip
        if piece_data.css("span[property='schema:mainEntityOfPage']").attr('content')
            url = piece_data.css("span[property='schema:mainEntityOfPage']").attr('content').value
        else
            url = "http://www.almanac.com"
        end

        recipe ? text = "YOW...A RECIPE!" : text = piece_data.css(".field-item[property='schema:articleBody']")[0]
        # if recipe
        #     text = "YOW...A RECIPE!" # div#article-feature > .region-inner
        # else
        #     text = piece_data.css(".field-item[property='schema:articleBody']")[0]
        # end
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

    def self.scrape_and_create_section_pieces(sec_url)
        pieces = []
        page = get_section_front(sec_url)
        page.css("#block-system-main .block-content .view-content a").each{|u| pieces << scrape_piece(u.attr("href"))}
        pieces
    end

    # def self.scrape_section_pieces(sec_url)
    #     page = get_section_front(sec_url)
    #     pieces = page.css("#block-system-main .block-content .view-content")
    #     title = page.css("h2").text.strip
    #     subhead = page.css("h3").text.strip
    #     url = page.css("a").attr("href").value
    #     pubdate = "today"
    #     author = "editors"
    #     # text = 
    # end

end