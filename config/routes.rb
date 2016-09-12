Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get 'trips/available', to: 'trips#available'

  resources :trips do
    resources :requests, shallow: true
  end

  resources :users
  get '/users/:id/trips', to: 'users#trips'
end


