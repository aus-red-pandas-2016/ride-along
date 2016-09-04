require 'rails_helper'

RSpec.describe Trip, type: :model do
  context 'has type' do 
    before {FactoryGirl.build(:trip)}
    
    it { should validate_presence_of(:trips_type)}
    it { should have_and_belong_to_many(:riders)}
    it { should belong_to(:driver)}
  end
end