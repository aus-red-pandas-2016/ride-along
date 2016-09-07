require 'rails_helper'

describe User do
  context 'attributes' do
    before { build(:user) }

    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:auth_token) }
  end

  context 'validations' do
    before { build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:auth_token) }
    it { should validate_confirmation_of(:password) }
    it { should allow_value('test@example.com').for(:email) }
  end

  describe '#generate_authentication_token' do
    before { @user = create(:user) }

    it 'generates a unique token' do
      allow(Devise).to receive(:friendly_token).and_return('uniqtoken123')
      @user.generate_authentication_token!
      expect(@user.auth_token).to eq 'uniqtoken123'
    end

    it 'generates another token when one has been taken' do
      existing_user = create(:user, auth_token: 'anothertoken123')
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eq existing_user.auth_token
    end
  end
end
