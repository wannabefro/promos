require 'rails_helper'

feature 'user views stats on promotion' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:promotion) { FactoryGirl.create(:promotion, :with_unique_codes, user: user) }
  let(:promo_code) { promotion.codes.first }
  let!(:redemption) { FactoryGirl.create(:redemption, :real_ip, code: promo_code) }

  before(:each) do
    promo_code.redeemed!
  end

  scenario 'see a page with all current promotions' do
    sign_in_as user
    visit promotions_path
    expect(page).to have_content(promotion.name)
  end

  scenario 'I can view an ongoing promotion\'s stats' do
    sign_in_as user
    visit promotion_path(promotion)

    expect(page).to have_content('1/10 codes redeemed')
  end
end
