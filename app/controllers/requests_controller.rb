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
		render json: @request, status: :created
	end

	def update
	  @request = Request.find params[:id]
	  if params[:response] == "accept"
	  	@request.trip.riders << @request.user
	  	@request.pending = false
	  end
	  @request.save
	end
end
