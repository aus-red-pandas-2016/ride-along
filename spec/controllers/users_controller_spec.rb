require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    it 'returns the users info' do
      user = create(:user)

      get :show, params: { id: user.id }, format: :json

      expect(response).to be_successful
      expect(response_body[:email]).to eq user.email
    end
  end
end

def response_body
  JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
end
