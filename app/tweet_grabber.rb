class TweetGrabber
  attr_accessor :all

  # REST CLIENT CONFIGURATION ----- PLEASE USE CAREFULLY SO I DONT GET BANNED!!!
  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = "e24BRt5RyNT0HWwXZYNemgXoO"
    config.consumer_secret     = "my5zRI30lGUm7MIGHglHzYqqUnKdc89U1RqFq38eyYhIK7C603"
  end

  def initialize(woman)
    @client = CLIENT
    @all = []
    populate(woman)
  end

  def populate(woman)
    @client.search(woman, result_type: type = "mixed", lang: "en").take(10).each do |tweet|
      unless self.all.include?(@client.oembed(tweet.id).html)
        self.all << @client.oembed(tweet.id).html
      end
    end
  end

end
