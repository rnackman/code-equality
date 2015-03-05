class Seed

  def initialize(name)
    @woman = name
    add
  end

  def add
  w = Individual.create(name: @woman, downcasename: @woman.downcase)
  tweets = TweetGrabber.new(w.name).all
    tweets.each do |tweet|
      t = Tweet.create(html: tweet)
      t.individual = w
      t.save
    end

    wiki = WikiScraper.new(w.name)
    w.has_wiki_page = wiki.has_page?
      if w.has_wiki_page == true
        w.bio = wiki.scrape_bio.gsub(/\[[0-9]+\]/, '') + "  (Source: Wikipedia)"
        w.wiki_page_link = "https://en.wikipedia.org/wiki/#{w.name.gsub(" ", "_")}"
      else
        w.wiki_create_link = "https://en.wikipedia.org/w/index.php?title=#{w.name.gsub(" ", "_")}&action=edit"
      end
      w.save
  end

end
