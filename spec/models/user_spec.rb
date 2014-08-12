require 'rails_helper'

describe User do
  it { should have_many(:promotions) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  
  context 'uniqueness' do
    before(:each) do
      FactoryGirl.create(:user)
    end

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end
end
