Rails.application.routes.draw do

  devise_for :users
  post '/auth' => 'authentication#authenticate_user'

  get 'trips/available', to: 'trips#available'
  get 'trips/drives', to: 'trips#drives'

  resources :trips do
    resources :requests, shallow: true
  end

  resources :users
  get '/users/:id/trips', to: 'users#trips'
end


