require 'rails_helper'

feature 'user redeems promo code' do
  let(:promotion) { FactoryGirl.create(:promotion, :with_unique_codes) }
  let(:promo_code) { promotion.codes.first }
  let(:token) { promo_code.token }
  scenario 'a user sees a thankyou message if they successfully redeem a code' do
    visit "/#{token}"
    expect(page).to have_content(promotion.message)
  end

  scenario 'a unique code can not be used twice' do
    visit "/#{token}"
    expect(page).to have_content(promotion.message)
    visit "/#{token}"
    expect(page).to have_content('Sorry that code has already been used')
  end

  scenario 'when a code is redeemed a redemption should be created' do
    previous_count = promo_code.redemptions.count
    visit "/#{token}"
    expect(promo_code.redemptions.count).to eql(previous_count + 1)
  end
end
