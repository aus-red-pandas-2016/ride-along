Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:create, :show, :update]
  resources :sessions, only: [:create, :destroy]
end


