require 'pry'
require 'nokogiri'
require 'open-uri'

class WikiScraper
attr_accessor :url, :name
  def initialize(name)
    @name = name
    @url = "https://en.wikipedia.org/wiki/#{name.gsub(" ", "_")}"
  end

  def has_page?
    begin
      html = open(self.url)
      data = Nokogiri::HTML(html)
      true
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
        false
      end
    end
  end
  
  def scrape_bio
    html = open(self.url)
    data = Nokogiri::HTML(html)
    data.css("div#mw-content-text p:nth-child(2)").text
  end
end

