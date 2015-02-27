require './config/environment.rb'

class GraceHopperTime < Sinatra::Base

  get '/' do
    @woman = Individual.all.sample
    @tweets = TweetGrabber.new(@woman.name).all
    if @woman.has_wiki_page
      @stat = WikiStats.new(@woman.name).scrape_stats.strip.gsub("_", " ")
      @header = @woman.name.upcase+" HAS A WIKIPEDIA PAGE"
      @directive = "<a href='#{@woman.wiki_page_link}' target='_blank'>WHY DON'T YOU MAKE IT BETTER?</a>"
    else
      @header = @woman.name.upcase+" DOES NOT HAVE A WIKIPEDIA PAGE"
      @directive = "<a href='#{@woman.wiki_create_link}' target='_blank'>WHY DON'T YOU MAKE HER ONE?</a>"
    end
    @twitter_intro = "Here's what people have been saying about her on Twitter:"

    erb :main
  end

end
