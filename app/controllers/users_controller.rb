class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!
  before_action :set_user, only: [:show]

  def show
    render json: @user
  end

  def create
    p user_params
    @user = User.new user_params

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find params[:id]
  end
end