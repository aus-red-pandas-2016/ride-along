class TripsController < ApplicationController
  include ActionController::Serialization 
  # skip_before_action :authenticate_user_from_token!

  def index 
    @trips = Trip.all 
    render json: @trips 
  end

  def available 
    user =  User.find(params[:user_id])
    @trips = Trip.all - user.trips - user.rides
    render json: @trips
  end

  def show
    @trip = Trip.find(params[:trip_id])
    render json: @trip
  end

  def create
    user = User.find(params[:user_id])
    @trip = user.trips.new(driver_id: user.id,trips_type: params[:type])
    if @trip.save 
      render json: @trip, status: :created
    else
      render json: @trip.errors, status: :unprocessable_entity
    end 
  end

  def update
    trip = Trip.find(params[:trip_id])
    rider = User.find(params[:user_id])
    trip.riders << rider
    trip.save
    
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    trip.destroy
  end
end