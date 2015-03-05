require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do
  Pry.start
end

task :seed do
  load './db/seeds.rb'
end

task :seed_test do
  load './db/seeds_test.rb'
end
