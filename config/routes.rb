Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # devise_for :users

  resources :users, only: [:create, :show, :update, :destroy]
  # resources :sessions, only: [:create, :destroy]
end


