require 'rails_helper'

describe Promotion do
  it { should belong_to(:user) }

  it { should have_many(:codes) }
  it { should have_one(:card) }
  it { should have_many(:redemptions) }
  it { should have_many(:attachments) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }

  it { should ensure_length_of(:message).is_at_most(500) }

  context 'code quantity' do
    it 'should be greater than 0' do
      promo = FactoryGirl.build(:promotion)
      promo.code_quantity = 0
      expect(promo).to_not be_valid
    end

    it 'should be less than 101' do
      promo = FactoryGirl.build(:promotion)
      promo.code_quantity = 101
      expect(promo).to_not be_valid
    end
  end

  context 'card' do
    it 'should create a code after creation' do
      promotion = FactoryGirl.create(:promotion)
      expect(promotion.card).to_not be_nil
    end
  end
end
