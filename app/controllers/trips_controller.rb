class TripsController < ApplicationController
  # before_filter :authenticate_request!

  def index
    @trips = Trip.all
    render json: @trips
  end

  def available
    @user =  User.find(1)
    @matches = @user.matches
  end

  def drives
    @user = User.find(1)
    @drives = @user.trips.includes(:riders, :requests)
  end

  def show
    @trip = Trip.find(params[:trip_id])
    render json: @trip
  end

  def create
    user = User.find(params[:user_id])
    @trip = user.trips.new(driver_id: user.id,
                           departure_time: params[:departure_time],
                           arrival_time: params[:arrival_time]
                          )
    if @trip.save
      render json: @trip, status: :created
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def update
    trip = Trip.includes(:riders).find(params[:id])
    trip.riders.delete(params[:user_id])
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    trip.destroy
  end
end
