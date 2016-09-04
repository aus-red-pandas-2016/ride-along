require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    it 'returns the users info' do
      user = create(:user)

      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :show, id: user.id, format: :json, auth_token: user.access_token

      expect(response).to be_successful
    end
  end
end
