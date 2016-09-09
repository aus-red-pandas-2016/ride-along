class RequestsController < ApplicationController
	
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