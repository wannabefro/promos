require 'rails_helper'

describe Code do
  it { should belong_to(:promotion) }
  it { should have_many(:redemptions) }

  it { should validate_presence_of(:promotion) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:unique) }

  context '#generate_token' do
    it 'should generate a random token before saving' do
      code = FactoryGirl.build(:code, token: nil)
      expect(code.token).to eql(nil)

      code.save!
      expect(code.token).to_not eql(nil)
      expect(code.token.length).to eql(10)
    end
  end
end
