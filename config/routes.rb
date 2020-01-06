Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles
  resources :projects

  get 'health', to: 'pages#health'
  get 'interviews', to: 'pages#interviews'
  get 'music', to: 'pages#music'
  get 'now', to: 'pages#now'
  get 'podcasts', to: 'pages#podcasts'
  get 'reading', to: 'pages#reading'
  get 'learning', to: 'pages#learning'
  get 'gear', to: 'pages#gear'

  get '/music/2018', to: 'pages#music_2018'
  get '/music/2019', to: 'pages#music_2019'

  get '/past', to: redirect('/projects')

  root 'pages#index'
end
