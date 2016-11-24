require "rails_helper"

RSpec.feature "Booking", js: true do
  before(:each) do
    @user = create(:user)
    @origin = create(:airport)
    @destination = create(:airport)
    @flight = create(
      :flight,
      origin: @origin.code,
      destination: @destination.code
    )
  end

  scenario "User searches for flight and selects it for booking" do
    search_to_book
    expect(page).to have_content("Book Flight")
  end

  scenario "User completes a full booking process" do
    search_to_book
    fill_in_booking_details(@user.email, @user.full_name, "B1234", "421528")
    expect(page).to have_content("Your booking was successfully created.")
  end

  scenario "User does not fill in the email" do
    search_to_book
    fill_in_booking_details("", @user.full_name, "B1234", "421528")
    expect(page).to have_content("Email can't be blank")
  end

  scenario "User fills in no data" do
    search_to_book
    fill_in_booking_details("", "", "", "")
    expect(page).to have_content("errors found")
    expect(page).to have_content("Passengers name can't be blank")
    expect(page).to have_content("Passengers passport number can't be blank")
  end

  scenario "Registered user completes a full booking process" do
    login_with(@user.email, @user.password)
    search_to_book
    fill_in_booking_details(nil, @user.full_name, "B1234", "421528")
    visit(bookings_user_path(@user))
    expect(page).to have_content("CANCEL BOOKING")
    expect(page).to have_content(@flight.origin_airport.name)
    expect(page).to have_content(@flight.destination_airport.name)
  end

  def fill_in_booking_details(email, name, passport, phone)
    fill_in "email", with: email if email
    fill_in "name", with: name
    fill_in "p_number", with: passport
    fill_in "phone", with: phone
    click_on("book")
  end

  def search_to_book
    search_flights(@origin.formatted, @destination.formatted, "2017/02/02")
    find_by_id(@flight.id).click
    click_on("select")
  end
end
