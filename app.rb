require './config/environment.rb'

class GraceHopperTime < Sinatra::Base

  get '/' do
    @woman = Individual.all.sample
    build_display_material(@woman)
    erb :main
  end

  get '/index' do
    @all = Individual.all
    erb :index
  end

  get '/about' do
    erb :about
  end

  get '/:name' do
    name = params[:name].gsub(/_/, ' ')
    @woman = Individual.find_by(downcasename: name)
    build_display_material(@woman)
    erb :main
  end

  def build_display_material(woman)
    if woman.has_wiki_page
      @stat = WikiStats.new(woman.name).scrape_stats.strip.gsub("_", " ")
      @header = woman.name.upcase + " HAS A WIKIPEDIA PAGE"
      @directive = "<a href='#{woman.wiki_page_link}' target='_blank'>WHY DON'T YOU MAKE IT BETTER?</a>"
    else
      @header = woman.name.upcase + " DOES NOT HAVE A WIKIPEDIA PAGE"
      @directive = "<a href='#{woman.wiki_create_link}' target='_blank'>WHY DON'T YOU MAKE HER ONE?</a>"
    end
    @twitter_intro = "Here's what people have been saying about her on Twitter:"
  end
end
