require 'spec_helper'

describe Place do
  let(:place) { FactoryGirl.build :place }
  subject { place }

  it { should respond_to(:street) }
  it { should respond_to(:city) }
  it { should respond_to(:state) }
  it { should respond_to(:user_id) }

end