class TripsController < ApplicationController
  include ActionController::Serialization 
  # skip_before_action :authenticate_user_from_token!

  def index 
    user = User.find(params[:user_id])
    trips = user.trips
    rides = user.rides
    @trips = {trips: trips, rides: rides}
    render json: @trips 
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