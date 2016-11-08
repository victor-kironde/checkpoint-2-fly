require 'rails_helper'

RSpec.feature 'User Logout', js: true do
  before(:all) { @user = create(:user) }

  scenario 'registered and logged in user signs out' do
    login_with(@user.email, @user.password)
    click_on 'Log Out'
    expect(page).to have_content('Log In')
    expect(page).to have_content("You have successfully Logged out")
  end
end
