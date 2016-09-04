Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:create, :show]
  post '/login', to: 'sessions#create'
  get '/trips', to: 'trips#index'
  post '/trips', to: 'trips#create'
  put 'trips/:trip_id', to: 'trips#update'
  patch 'trips/:trip_id', to: 'trips#update'
  delete 'trips/:trip_id', to: 'trips#destroy'

end


