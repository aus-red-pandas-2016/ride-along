class PlacesController < ApplicationController
	skip_before_action :authenticate_user_from_token!
	def create
    @place = Place.new place_params

    if @place.save
      render json: @place, status: :created, location: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  def show
  	@place = Place.find(1)
  	render json: @place
  end
	
	def delete
		@place = Place.find(params[:id])
		@place.destroy
	end

	private
  def place_params
    params.require(:place).permit(:type, :street, :city, :state, :zip)
  end
end