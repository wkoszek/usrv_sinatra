require "rubygems"
require "sinatra"

class App < Sinatra::Base

  set :root, File.dirname(__FILE__)
  enable :sessions

  get "/" do
    erb :index
  end
end
