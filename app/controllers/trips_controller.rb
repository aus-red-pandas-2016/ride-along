class TripsController < ApplicationController
  include ActionController::Serialization 
  skip_before_action :authenticate_user_from_token!

  def index 
    user = User.find(params[:user_id])
    trips = user.trips
    rides = user.rides
    @trips = {trips: trips, rides: rides}
    render json: @trips 
  end

  
end