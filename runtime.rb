require './config/environment.rb'
require 'pry'

class RunTime < Sinatra::Base
  get '/' do
    @woman = Individual.all.sample
    # get_tweets = TweetGrabber.new
    # get_tweets.populate(@woman)
    # @tweets = tweets.all
    @stat = WikiStats.new(@woman.name).scrape_stats.strip.gsub("_", " ")
    erb :main
  end
end