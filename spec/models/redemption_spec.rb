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

  context 'ip address' do
    it 'should return geo data for an ip address' do
      VCR.use_cassette('geolocation') do
        redemption = FactoryGirl.create(:redemption, :real_ip)
        expect(redemption.location.class).to eql(Geokit::GeoLoc)
      end
    end
  end
end
