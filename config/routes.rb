Rails.application.routes.draw do  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :articles
  resources :projects
  resources :toys
  resources :nfts

  get 'health', to: 'pages#health'
  get 'interviews', to: 'pages#interviews'
  get 'music', to: 'pages#music'
  get 'now', to: 'pages#now'
  get 'podcasts', to: 'pages#podcasts'
  get 'reading', to: 'pages#reading'
  get 'learning', to: 'pages#learning'
  get 'gear', to: 'pages#gear'

  root "pages#index"
end
