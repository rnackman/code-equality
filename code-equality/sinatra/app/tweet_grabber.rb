class TweetGrabber
  attr_accessor :all

  # REST CLIENT CONFIGURATION ----- PLEASE USE CAREFULLY SO I DONT GET BANNED!!!
  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = "e24BRt5RyNT0HWwXZYNemgXoO"
    config.consumer_secret     = "my5zRI30lGUm7MIGHglHzYqqUnKdc89U1RqFq38eyYhIK7C603"
  end

  def initialize(programmer)
    @client = CLIENT
    @all = []
    populate(programmer)
  end

  def populate(programmer)
    @client.search(programmer, result_type: type = "mixed", lang: "en").take(5).each do |tweet|
      html_tweet = @client.oembed(tweet.id).html
        self.all << html_tweet unless self.all.include?(html_tweet)
    end
  end

end
