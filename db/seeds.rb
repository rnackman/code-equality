require './config/environment.rb'
require 'pry'
# Create an array of individuals.
amazing_women = ["Grace Hopper", "Sandi Metz", "Grace Hopper"] # To grow eventually. I know Sandi Metz doesn't have a page.

amazing_women.each do |woman|
  w = Individual.create(name: woman)
  wiki = WikiScraper.new
  # Scrape bio source and add to Individual row.
  w.has_wiki_page = wiki.has_page?(w.name)

  if w.has_wiki_page
    w.bio = wiki.scrape_bio(w.name).delete("/\[[0-9]\]/")
    w.wiki_page_link = "https://en.wikipedia.org/wiki/#{w.name.gsub(" ", "_")}"
    w.wiki_page_word_count = w.bio.split(' ').size
  end
  binding.pry
end