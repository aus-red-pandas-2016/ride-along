require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
	before(:each) do
		@user1 = FactoryGirl.create(:user)
		@place1 = FactoryGirl.create(:place, user:@user1)
	end

	#{request.headers['Accept'] =  "#{Mime[:json]}" }

	describe 'POST #create' do
    context 'when successfully created' do
    	before(:each) do
    		@place_attributes = attributes_for(:place)
    		post :create, params:{user_id: @place1.user_id, place: @place_attributes}
      end
    	it "creates a new place" do
      	expect{post :create, params:{user_id: @place1.user_id, place: @place_attributes}
      }.to change(Place,:count).by(1)
    	end

    	it 'renders json representation for the place just created' do
    		@response = JSON.parse(response.body)
        expect(response["street"]).to eq @place_attributes[:street]
      end
    
    end	
  end

  # describe 'PUT/PATCH #update' do
  #   before(:each) do
  #     @user = create(:user)
  #     @place = create(:place)
  #     auth_header(@user.auth_token)
  #   end
  # end
end