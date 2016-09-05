require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
	describe "GET #show" do
		before(:each) do
      @place = FactoryGirl.build :place
    end
    it 'returns the places info' do
      get :show, params: {id: @place.id}
      expect(response).to be_successful
    end

    # it "returns the information about a place on a hash" do
    #   place_response = json_response
    #   expect(place_response[:street]).to eql @place.street
    # end

    # it { should respond_with 200 }
  end
end