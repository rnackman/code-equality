require './config/environment.rb'

amazing_women = ["Grace Hopper", "Sandi Metz", "Ada Lovelace"]

Individual.destroy_all

amazing_women.each do |woman|
  w = Individual.create(name: woman)
  wiki = WikiScraper.new(w.name)
  w.has_wiki_page = wiki.has_page?
  if w.has_wiki_page == true
    w.bio = wiki.scrape_bio.delete('/(\[.+\])/')+"  (Source: Wikipedia)"
    w.wiki_page_link = "https://en.wikipedia.org/wiki/#{w.name.gsub(" ", "_")}" 
  else
    w.wiki_create_link = "https://en.wikipedia.org/w/index.php?title=#{w.name.gsub(" ", "_")}&action=edit"
  end
  w.save
end
