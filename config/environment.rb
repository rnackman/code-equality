require 'bundler/setup'
Bundler.require
require 'sinatra/activerecord'
require 'rake'

require_all 'app'

ActiveRecord::Base.establish_connection(
 :adapter => "sqlite3",
 :database => "db/hopper_time.sqlite3"
)