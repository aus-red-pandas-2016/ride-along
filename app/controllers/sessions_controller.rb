class SessionsController < ApplicationController

  def create
    password = params[:session][:password]
    email = params[:session][:email]
    user = User.find_by_email email

    if user.valid_password? password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200, location: user
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  # private
  # def invalid_login_attempt
  #   warden.custom_failure!
  #   render json: {error: t('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
  # end
end
