require 'rails_helper'

class Authentication < ActionController::Base
  include Authenticable
end

describe Authenticable do
  let(:authentication) { Authentication.new }

  describe '.current_user' do
    before do
      @user = create(:user)
      request.headers['Authorization'] = @user.auth_token
      allow(authentication).to receive(:request).and_return(request)
    end

    it 'should return the user from the authorization header' do
      expect(authentication.current_user.auth_token).to eq @user.auth_token
    end
  end

  describe '.authenticate_with_token!' do
    before do
      allow(authentication).to receive(:current_user).and_return(nil)
      allow(authentication).to receive(:render) do |args|
        args
      end
    end

    it 'returns an error' do
      expect(authentication.authenticate_with_token![:json][:errors]).to eq "Not authenticated!"
    end

    it 'returns unauthorized status' do
      expect(authentication.authenticate_with_token![:status]).to eq :unauthorized
    end
  end

  describe '.user_signed_in?' do
    context "when there is a user on 'session'" do
      before do
        @user = create :user
        authentication.stub(:current_user).and_return(@user)
      end

      it 'should sign in the user' do
        expect(authentication.user_signed_in?).to be_truthy
      end
    end

    context "when there is not a user on 'session'" do
      before do
        authentication.stub(:current_user).and_return(nil)
      end

      it 'should not sign in a user' do
        expect(authentication.user_signed_in?).to be_falsey
      end
    end
  end
end
