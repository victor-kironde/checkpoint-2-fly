require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        :cost => 2
      ),
      Booking.create!(
        :cost => 2
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
