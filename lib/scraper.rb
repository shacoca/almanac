require_relative "../config/environment.rb"

class Scraper
    attr_accessor :main_site, :section_front
    
    def self.main_site
        @main_site =  Nokogiri::HTML(open(SITE))
    end

    def self.section_front(section)
        section_front_url = "#{SITE}/#{section}"
        @section_front = Nokogiri::HTML(open(section_front_url))
    end



end