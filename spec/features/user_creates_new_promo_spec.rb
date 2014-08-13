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
    previous_count = Attachment.count

    visit new_promotion_path
    fill_in 'Name', with: 'Best Promotion Ever'
    fill_in 'Thank you message', with: 'Thanks!!'
    attach_file('promotion_attachments_attributes_0_attachment', [image('kangaroo.jpg'), image('koala.jpg')])
    click_on 'Create Promotion'

    expect(Attachment.count).to eql(previous_count + 2)
    expect(page).to have_content('Successfully created promotion')
  end

  def image(filename)
    "#{Rails.root}/spec/fixtures/images/#{filename}"
  end
end
