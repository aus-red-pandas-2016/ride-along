Rails.application.routes.draw do
  devise_for :users, only: []

  post '/login', to: 'sessions#create'
  get '/trips', to: 'trips#index'
  post '/trips', to: 'trips#create'
  put 'trips/:trips_id', to: 'trips#update'
  patch 'trips/:trips_id', to: 'trips#update'
  delete 'trips/:trips_id', to: 'trips#delete'
  
end


