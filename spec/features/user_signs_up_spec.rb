require 'rails_helper'

feature 'a user signs up' do
  let(:user) { FactoryGirl.build(:user) }

  scenario 'sign up form' do
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, match: :prefer_exact
    fill_in 'Password confirmation', with: user.password, match: :prefer_exact
    click_on 'Sign up'

    expect(page).to have_content('Welcome to Promo!')
  end
end
