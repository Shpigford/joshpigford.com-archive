require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader' if development?
require 'rdiscount'
require 'yaml'

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

Dir.glob('posts/*.md').each do |file|
  parts = file.gsub('posts/','').split('.')
  date = parts[0]
  slug = parts[1]

  metadata = YAML.load_file(file)

  get "/articles/#{slug}" do
    @title = metadata['title']
    @content = RDiscount.new( File.open(file).read.gsub(/---(.|\n)*---/, '')).to_html
    @published = Date.parse(date).strftime('%B %e, %Y')
    @description = @content.gsub(%r{</?[^>]+?>}, '')[0...100]
    erb :"articles/layout", layout: false
  end
end