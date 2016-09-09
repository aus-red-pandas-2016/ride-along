class RequestsController < ApplicationController

	def index
		trip = Trip.find(params[:trip_id])
		requests = trip.requests
		render json: requests, include: [:user]
	end

	def show
		request = Request.find(params[:id])
		render json: request, include: [:user]
	end

	def create
		@trip = Trip.find(params[:trip_id])
		@request = @trip.requests.create(user_id: params[:user_id], pending: true)
		render json: @request
	end

	def update
		@trip = Trip.find(params[:trip_id])
	  @request = Request.find(params[:request_id])
	  if params[:answer] == 'accept'
	  	@trip.riders << User.find(params[:user_id])
	  end
	  @request.pending = false
	end
end
