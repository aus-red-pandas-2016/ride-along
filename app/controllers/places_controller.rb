class PlacesController < ApplicationController
	skip_before_action :authenticate_user_from_token!
	

  def show
    @place = Place.find(params[:id])
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