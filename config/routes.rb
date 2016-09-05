Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:create, :show]
  post '/login', to: 'sessions#create'

  #resources :users, only: :show do
  	resources :places , only: [:create, :update, :destroy]
end


