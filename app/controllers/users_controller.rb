class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :trips, :destroy]

  def trips
    trips = Trip.where(driver: @user).includes(:requests)
    render json: trips.as_json(include: [:requests])
  end

  def show
    render json: @user
  end

  def create
    @user = User.new user_params

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def update
    user = current_user

    if user.update(user_params)
      render json: user, status: 200, location: user
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

