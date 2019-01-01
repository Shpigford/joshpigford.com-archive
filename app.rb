require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
  erb :index
end

get '/now' do
  @title = "What I'm working on now"
  erb :now
end