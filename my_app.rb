# Set
require 'sinatra'

class MyApp < Sinatra::Base
  get "/" do
    "hello world"
  end
end