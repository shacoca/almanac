require_relative './almanac.rb'

class Scraper

  def get_front_page
    almanac_front_page = Nokogiri::HTML(open("https://www.almanac.com"))
  end
