require 'rails_helper'

describe Redemption do
  it { should belong_to(:code) }
  
  it { should validate_presence_of(:ip_address) }
  it { should validate_presence_of(:code) }

  context 'uniqueness' do
    before(:each) { FactoryGirl.create(:redemption) }
    it 'should have a unique ip address per code' do
      redemption = FactoryGirl.build(:redemption, ip_address: Redemption.first.ip_address, code: Redemption.first.code)
      expect(redemption).to_not be_valid
    end
  end
end
