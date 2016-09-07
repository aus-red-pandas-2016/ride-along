require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'POST #create' do
    before(:each) { @user = create(:user) }

    context 'when the credentials are correct' do
      before(:each) do
        credentials = { email: @user.email, password: @user.password }
        post :create, params: { session: credentials }
      end

      it 'returns the user corresponding to the credentials' do
        @user.reload
        expect(response_body[:"auth-token"]).to eq @user.auth_token
      end

      it { should respond_with 200 }
    end

    context 'when the credentials are incorrect' do
      before(:each) do
        bad_credentials = { email: @user.email, password: 'invalid' }
        post :create, params: { session: bad_credentials }
      end

      it 'should return a json error' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors]).to eq "Invalid email or password"
      end

      it { should respond_with 422 }
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @user = create(:user)
      sign_in @user
      delete :destroy, params: { id: @user.auth_token }
    end

    it { should respond_with 204 }
  end
end
