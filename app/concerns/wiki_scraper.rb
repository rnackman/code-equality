require 'pry'
require 'nokogiri'
require 'open-uri'

class WikiScraper

  def scrape_bio(name)
    data = Nokogiri::HTML(open("https://en.wikiquote.org/wiki/#{name.gsub(" ", "_")}"))
    data.css("div#mw-content-text p:nth-child(2)").text
  end

  def scrape_quotes(name)
    Nokogiri::HTML(open("https://en.wikiquote.org/wiki/#{name.gsub(" ", "_")}")).css("div#mw-content-text ul li b").collect{|q| q.text}
  end
end

# This will break if WikiQuotes doesn't have a page.
# Figure out how to scrape Wikipedia rather than WikiQuotes for info/notification that woman doesn't have a page.