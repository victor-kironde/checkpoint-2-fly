require "rails_helper"

RSpec.feature "Sign Up", js: true do
  let(:user_registered) { create(:user) }
  let(:user) { build(:user) }

  scenario "User clicks on Register" do
    visit root_path
    click_on "Sign Up"
    expect(page).to have_content("SIGN UP")
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Email")
  end

  scenario "User signs up with valid Credentials" do
    signup(user.first_name, user.last_name, user.email, user.password,
           user.password_confirmation)
    expect(page).to have_content("Log Out")
    expect(page).to have_content("Welcome #{user.first_name}")
  end

  scenario "User enters a used email" do
    signup(user.first_name, user.last_name,
           user_registered.email, user.password,
           user.password_confirmation)
    expect(page).to have_content("Email has already been taken")
  end

  scenario "User enters no data at all" do
    signup("", "", "", "", "")
    expect(page).to have_content("errors found")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Password confirmation can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Email is invalid")
  end

  def signup(first_name, last_name, email, password, password_confirmation)
    visit signup_path
    fill_in "firstname", with: first_name
    fill_in "lastname", with: last_name
    fill_in "email", with: email
    fill_in "password", with: password
    fill_in "confirm", with: password_confirmation
    click_button "Register"
  end
end
