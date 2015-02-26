require './config/environment.rb'

class RunTime < Sinatra::Base
  get '/' do
    @woman = Individual.all.sample
    erb :main
  end
end