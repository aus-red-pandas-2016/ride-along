Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:create, :show, :update]
  post '/login', to: 'sessions#create'
end


