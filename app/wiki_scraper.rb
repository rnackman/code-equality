require 'pry'
require 'nokogiri'
require 'open-uri'

class WikiScraper
attr_accessor :bio, :has_wiki_page, :url

  def has_page?(name)
    @url = "https://en.wikipedia.org/wiki/#{name.gsub(" ", "_")}"
    begin
      html = open(self.url)
      data = Nokogiri::HTML(html)
      self.has_wiki_page = true
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
        self.has_wiki_page = false
      end
    end
  end
  
  def scrape_bio(name)
    html = open(self.url)
    data = Nokogiri::HTML(html)
    data.css("div#mw-content-text p:nth-child(2)").text
  end
end

