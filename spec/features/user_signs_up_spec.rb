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

  scenario 'with facebook' do
    stub_auth_response
    visit new_user_registration_path
    click_on 'Sign in with Facebook'
    expect(page).to have_content('Successfully authenticated from Facebook account')
  end

  scenario 'a user should not be signed up if auth fails' do
    stub_bad_response
    visit new_user_registration_path
    click_on 'Sign in with Facebook'
    expect(page).to have_content("Could not authenticate you from Facebook")
  end
end
