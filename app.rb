require "sinatra"
require "erubis"
require "active_record"
require "sass"
Dir["./models/*.rb"].each { |m| require m }

CONFIG = YAML.load_file("config.yml")[Sinatra::Application.environment.to_s]
ActiveRecord::Base.establish_connection CONFIG["db"]

set :erb, :escape_html => true

get "/" do
  erb :index
end

get "/style.css" do
  scss :style
end