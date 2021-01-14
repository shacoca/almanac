TODO: scrape data => make pieces

TODO: Section.pieces get from Pieces.all

TODO: fill out Scraper methods

TODO: make sense of folder structure for pages such as...
    plant/strawberries
    wow-our-2021-garden-planner-will-transform-your-garden
    THISWORK?: to get url ext, wrapper.css("a").attr("href")  => #<Nokogiri::XML::Attr:0x3ffc70cf7018 name="href" value="/gardening">
    wrapper = 

****************************************************************
****************************************************************

scrap:
    # Scraper.get_piece_sections.css("div.news-field-body").attr("href")


#block-system-main > div > div.webb-container.webb-column-content.clearfix > div.webb-sidebar.webb-column-content-region.webb-column.panel-panel > div > section.panel-pane.pane-block.pane-siteui-latest-news.block > div > div > div.view.view-single-node-promo.view-id-single_node_promo.view-display-id-block_8.view-dom-id-cf531e49668da4a9987987b98c4e8d2d > div > div > div > a

.css("div#block-system-main div a")

#<Nokogiri::XML::Element:0x3fdad1dddc2c name="a" attributes=[#<Nokogiri::XML::Attr:0x3fdad1dddbb4 name="href" value="/recipe/vermont-farm-sandwich">]...


featured[3].css("a").last.attr("href")

div#content-column section#main-content

#article-feature > div.region.region-two-66-33-first > div

#article-feature > div.region.region-two-66-33-first > div > section.panel-pane.pane-entity-field.pane-node-field-ingredients-1.block > div > div > div > div
