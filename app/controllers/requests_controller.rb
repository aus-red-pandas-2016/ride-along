class RequestsController < ApplicationController
	
	def create
		@trip = Trip.find(params[:trip_id])
		@trip.requests.create(request_params)
	end

	def update
		@trip = Trip.find(params[:trip_id])
	    @request = Request.find(params[:request_id])
	    trip.requests << @request
	    trip.save
	end
end