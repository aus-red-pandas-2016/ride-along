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

  describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
        @user_attributes = attributes_for(:user)
        post :create, params: { user: @user_attributes }, format: :json
      end

      it 'renders json representation for the user just created' do
        expect(response_body[:email]).to eq @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context 'when not created' do
      before(:each) do
        invalid_user_attributes = { password: 'password', password_confirmation: 'password' }
        post :create, params: { user: invalid_user_attributes }, format: :json
      end

      it 'renders an errors json' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors]).to have_key(:email)
      end

      it 'renders an errors message on why the user could not be created' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end

def response_body
  JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
end
