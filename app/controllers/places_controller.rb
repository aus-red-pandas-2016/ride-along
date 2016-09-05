class PlacesController < ApplicationController
	 before_action :set_user

  def show
    @place = @user.places.find(params[:id])
    render json: @place
  end

  def create
    @place = @user.places.new(place_params)
    #@place = Place.find(params[:id])
    if @place.save
      render json: @place #, status: :created, location: @place
    else
      puts "Error!" 
    end
  end

  def update
    @place = @user.places.find(params[:id])
    @place.update(place_params)

    if @place.save
      render json: @place #, status: 200, location: @place
    else
       puts "Error!"
    end
  end
	
	def delete
		@place = @user.places.find(params[:id])
		#@place = Place.find(params[:id])
    @place.destroy
	end

	private
  def place_params
    params.require(:place).permit(:type, :street, :city, :state, :zip)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end