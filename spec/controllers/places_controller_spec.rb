require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
	before(:each) {request.headers['Accept'] =  "#{Mime[:json]}" }

	describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
      	@user = create(:user, id:1)
      	@place = create(:place)
        @place_attributes = attributes_for(:place)
        post :create, params: {user_id:@place.user_id, place: @place_attributes }
      end

      it 'renders json representation for the place just created' do
      	binding.pry
        expect(response_body[:street]).to eq @place_attributes[:street]
      end
     
     	it { should respond_with 201 }

    end
  end
end