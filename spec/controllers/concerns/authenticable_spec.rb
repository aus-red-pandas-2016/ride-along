require 'rails_helper'

class Authentication
  include Authenticable
end

xdescribe Authenticable do
  let(:authentication) { Authentication.new }
  subject { authentication }

  describe '#current_user' do
    before do
      @user = create(:user)
      request.headers["Authorization"] = @user.auth_token
      # authentication.stub(:request).and_return(request)
      allow(Authentication).to receive(:request).and_return(request)
    end

    it 'should return the user from the authorization header' do
      expect(authentication.current_user.auth_token).to eq @user.auth_token
    end
  end
end
