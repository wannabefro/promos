require 'rails_helper'

feature 'a user creates a promotion' do
  let!(:user) { FactoryGirl.create(:user) }
  before(:each) do
    sign_in_as user
  end

  scenario 'a user can visit a page to create a promotion' do
    click_on 'New Promotion'
    expect(page).to have_content('Create a new promotion')
  end

  scenario 'a user can create a promotion' do
    visit new_promotion_path
    fill_in 'Name', with: 'Best Promotion Ever'
   
  end
end
