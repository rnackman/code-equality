require './config/environment.rb'

class GraceHopperTime < Sinatra::Base

  get '/' do
    @woman = Individual.all.sample
    @tweets = TweetGrabber.new.populate(@woman.name)
    @stat = WikiStats.new(@woman.name).scrape_stats.strip.gsub("_", " ")
    erb :main
  end

end
