Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  post '/login', to: 'sessions#create'
  get '/trips', to: 'trips#index'
  post '/trips', to: 'trips#create'
  get 'trips/available', to: 'trips#available'
  get 'trips/:trip_id', to: 'trips#show'
  put 'trips/:trip_id', to: 'trips#update'
  patch 'trips/:trip_id', to: 'trips#update'
  delete 'trips/:trip_id', to: 'trips#destroy'

  resources :users, only: :show do
    resources :request, only: [:create, :update]
  end

  resources :users, only: [:create, :show, :update, :destroy]

  # resources :sessions, only: [:create, :destroy]
  resources :users, only: :show do
  	resources :places , only: [:show, :create, :update, :destroy]
  end

end


