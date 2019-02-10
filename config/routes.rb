Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles

  get 'health', to: 'pages#health'
  get 'interviews', to: 'pages#interviews'
  get 'music', to: 'pages#music'
  get 'now', to: 'pages#now'
  get 'past', to: 'pages#past'
  get 'podcasts', to: 'pages#podcasts'

  root 'pages#index'
end
