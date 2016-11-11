module Helpers
  def stub_current_user(user)
    allow_any_instance_of(ApplicationController).to receive(
      :current_user
    ).and_return(user)
  end

  def login_with(email, password)
    visit login_path
    fill_in "email", with: email
    fill_in "password", with: password
    click_on "Login"
  end

  def search_flights(origin, destination, date)
    visit root_path
    select origin, from: "originSelect"
    select destination, from: "destinationSelect"
    fill_in "date", with: date
    click_button "search"
  end
end
