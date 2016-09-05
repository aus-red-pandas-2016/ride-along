class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Authenticable

  protect_from_forgery with: :null_session

  respond_to :json
end
