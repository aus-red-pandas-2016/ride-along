require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
	before(:each) do
			request.headers['Accept'] =  "#{Mime[:json]}"
      @place = FactoryGirl.build :place
    end

	describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
        @place_attributes = attributes_for(:place)
        post :create, params: { place: @place_attributes }
      end

      it 'renders json representation for the place just created' do
        expect(response_body[:street]).to eq @place_attributes[:street]
      end
     
     	it { should respond_with 201 }

    end
  end
end