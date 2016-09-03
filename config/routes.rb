Rails.application.routes.draw do
  devise_for :users, only: []

  post '/login', to: 'sessions#create'
  get '/trips', to: 'trips#index'
end


