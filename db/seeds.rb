require './config/environment.rb'
require 'pry'
# Create an array of individuals.
amazing_women = ["Grace Hopper", "Sandi Metz", "Ada Lovelace"] # To grow eventually. I know Sandi Metz doesn't have a page.

Individual.destroy_all


amazing_women.each do |woman|
  w = Individual.create(name: woman)
  wiki = WikiScraper.new(w.name)
  w.has_wiki_page = wiki.has_page?
  if w.has_wiki_page == true
    w.bio = wiki.scrape_bio.delete("/\[[0-9]\]/")
    w.wiki_page_link = "https://en.wikipedia.org/wiki/#{w.name.gsub(" ", "_")}" 
  else
    w.wiki_create_link = "https://en.wikipedia.org/w/index.php?title=#{w.name.gsub(" ", "_")}&action=edit"
  end
  w.save
end

#TODO: Figure out what happens if you don't have a Wikipedia editor login. 
#Should we account for that edge case or instruct users to create a Wiki login before using?

###NOTA BENE###
# This is working if I pry into it, but for some reason I can't get it to seed the database properly.
# We should talk with Ian about this if one of you can't figure it out!
