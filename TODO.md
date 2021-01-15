TODO: finish display feature format

TODO: display_selected_section_fp_menu

TODO: scrape data => make pieces

TODO: Section.pieces get from Pieces.all

<!-- TODO: fill out Scraper methods -->

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

STYLES =
{
  # text properties
  none: 0, # turn off all attributes
  bold: 1, bright: 1, # bold or increased intensity
  faint: 2, # decreased intensity
  italic: 3, underline: 4,
  blink: 5, blink_slow: 5, # slow blink
  blink_fast: 6, # fast blink
  reverse: 7, # swap foreground and background colours
  hide: 8, # foreground color same as background
  crossed_out: 9,

  # foreground colours
  black: 30, grey: 90, lt_grey: 37, white: 97,
  red: 31, lt_red: 91,
  green: 32, lt_green: 92,
  dk_yellow: 33, brown: 33, yellow: 93,
  blue: 34, lt_blue: 94,
  magenta: 35, pink: 95, lt_magenta: 95,
  cyan: 36, lt_cyan: 96,
  default: 39,
  default_fg: 39,

  # background colours
  bg_black: 40, bg_grey: 100, bg_lt_grey: 47, bg_white: 107,
  bg_red: 41, bg_lt_red: 101,
  bg_green: 42, bg_lt_green: 102,
  bg_dk_yellow: 43, bg_brown: 43, bg_yellow: 103,
  bg_blue: 44, bg_lt_blue: 104,
  bg_magenta: 45, bg_pink: 105, bg_lt_magenta: 105,
  bg_cyan: 46, bg_lt_cyan: 106,
  default_bg: 49,
}
