require 'bundler/setup'
Bundler.require
require 'sinatra/activerecord'
require 'rake'

require_all 'app'
# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../app/concerns", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(
 :adapter => "sqlite3",
 :database => "db/hopper_time.sqlite3"
)