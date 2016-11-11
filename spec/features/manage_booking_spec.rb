require 'rails_helper'

RSpec.feature 'Manage Booking', js: true do
  before(:each) do
    @passenger = create(:passenger)
    @booking = @passenger.booking
    @airport = create(:airport, code: @booking.flight.origin)
    @airport = create(:airport, code: @booking.flight.destination)
    @invalid_booking = build(:booking)
  end

  scenario 'User clicks on Manage Booking' do
    visit root_path
    click_on 'Manage Booking'
    expect(page).to have_content('Confirmation number')
  end

  scenario 'User enters valid confirmation number' do
    visit find_bookings_path
    fill_in 'ref', with: @booking.reference
    click_button 'Search'
    expect(page).to have_content('Booking found')
    expect(page).to have_content(@booking.reference)
  end

  scenario 'User enters invalid confirmation number' do
    visit find_bookings_path
    fill_in 'ref', with: @invalid_booking.reference
    click_button 'Search'
    expect(page).to have_content('Booking does not exist.')
  end
end
