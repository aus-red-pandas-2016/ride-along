require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) { request.headers['Accept'] =  "#{Mime[:json]}" }

  describe 'GET #show' do
    it 'returns the users info' do
      user = create(:user)

      get :show, params: { id: user.id }

      expect(response).to be_successful
      expect(response_body[:email]).to eq user.email
    end
  end

  describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
        @user_attributes = attributes_for(:user)
        post :create, params: { user: @user_attributes }
      end

      it 'renders json representation for the user just created' do
        expect(response_body[:email]).to eq @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context 'when not created' do
      before(:each) do
        invalid_user_attributes = { password: 'password', password_confirmation: 'password' }
        post :create, params: { user: invalid_user_attributes }
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

  describe 'PUT/PATCH #update' do
    context 'when successfully updated' do
      before(:each) do
        @user = create(:user)
        patch :update, params: { id: @user.id, user: { email: 'newmail@example.com' } }
      end

      it 'renders json representation of the updated user' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(response_body[:email]).to eq 'newmail@example.com'
      end

      it { should respond_with 200 }
    end

    context 'when not updated' do
      before(:each) do
        @user = create(:user)
        patch :update, params: { id: @user.id, user: { email: 'bademail.com' } }
      end

      it 'renders json error' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors]).to have_key(:email)
      end

      it 'renders the json on why the user could not be created' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end
end

def response_body
  JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
end
