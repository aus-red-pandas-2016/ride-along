require 'spec_helper'

RSpec.describe PlacesController, type: :controller do
	describe "GET #show" do
    before(:each) do
      @place = FactoryGirl.create :place
      get :show, id: @place.id
    end

    # it "returns the information about a place on a hash" do
    #   place_response = json_response
    #   expect(place_response[:street]).to eql @place.street
    # end

    # it { should respond_with 200 }
  end
end