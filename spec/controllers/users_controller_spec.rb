require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    it 'returns the users info' do
      user = create(:user)
      auth_header = { "Authorization" => user.access_token }

      get :show, params: { id: user.id }, headers: auth_header
      # binding.pry
      expect(response).to be_successful
    end
  end
end

def response_body
  JSON.parse(response.body)
end
