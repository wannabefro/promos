require 'rails_helper'

describe Card do
  context 'validations' do
    before(:each) { Card.any_instance.stub(:set_default_values).and_return(nil) }

    it { should belong_to(:promotion) }

    it { should validate_presence_of(:header_color) }
    it { should validate_presence_of(:content_color) }
    it { should validate_presence_of(:header_text) }
    it { should validate_presence_of(:content_text) }
    it { should validate_presence_of(:promotion) }

    it { should ensure_length_of(:header_text).is_at_most(30) }
    it { should ensure_length_of(:content_text).is_at_most(50) }
  end

  context 'default values' do
    it 'should assign default values' do
      card = FactoryGirl.create(:card)

      expect(card.header_color).to eql('#2C3E50')
      expect(card.content_color).to eql('#E74C3C')
      expect(card.header_text).to eql(card.promotion.name)
      expect(card.content_text).to eql("Enjoy!!")
    end
  end
end
