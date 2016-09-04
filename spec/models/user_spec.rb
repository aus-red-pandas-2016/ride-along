require 'rails_helper'

describe User do
  context 'validations' do
    before { FactoryGirl.build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_confirmation_of(:password) }
    it { should allow_value('test@example.com').for(:email) }
  end
end
