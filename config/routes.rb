Rails.application.routes.draw do

  devise_for :users, only: []

  resources :users, only: [:create, :show]
  post '/login', to: 'sessions#create'
end


