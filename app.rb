require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader' if development?

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

get '/music' do
  @title = "Music"
  erb :music
end

get '/music/:post' do
  erb :"music/#{params['post']}"
end

get '/articles' do
  @title = "Articles"
  erb :articles
end

get '/articles/:post' do
  erb :"articles/#{params['post']}", layout: :"articles/layout"
end