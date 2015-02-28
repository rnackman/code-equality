require './config/environment.rb'

amazing_women = CSVScraper.new.all

Individual.destroy_all

amazing_women.each do |woman|
  woman.gsub!(/ë/, 'e')
  woman.gsub!(/ö/, 'o')
  woman.gsub!(/ğ/, 'g')
  woman.gsub!(/Ö/, 'O')
  w = Individual.create(name: woman)
  tweets = TweetGrabber.new(w.name).all
  tweets.each do |tweet|
    Tweet.create(html: tweet)
  end
  Tweet.all.each do |tweet|
    tweet.individual = w
    tweet.save
  end
  wiki = WikiScraper.new(w.name)
  w.has_wiki_page = wiki.has_page?
  if w.has_wiki_page == true
    w.bio = wiki.scrape_bio.gsub!(/\[[0-9]+\]/, '') + "  (Source: Wikipedia)"
    w.wiki_page_link = "https://en.wikipedia.org/wiki/#{w.name.gsub(" ", "_")}"
  else
    w.wiki_create_link = "https://en.wikipedia.org/w/index.php?title=#{w.name.gsub(" ", "_")}&action=edit"
  end
  w.save
end
