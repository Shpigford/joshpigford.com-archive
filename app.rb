require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
  erb :index
end

get '/now' do
  @title = "What I'm working on now"
  erb :now
end

get '/interviews' do
  @title = "Interviews"
  erb :interviews
end

get '/past' do
  @title = "Past projects"
  erb :past
end

get '/health' do
  @title = "Health"
  erb :health
end

get '/podcasts' do
  @title = "Podcasts"
  erb :podcasts
end