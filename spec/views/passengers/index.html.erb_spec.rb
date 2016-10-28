require 'rails_helper'

RSpec.describe "passengers/index", type: :view do
  before(:each) do
    assign(:passengers, [
      Passenger.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :passport_number => "Passport Number"
      ),
      Passenger.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :passport_number => "Passport Number"
      )
    ])
  end

  it "renders a list of passengers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Passport Number".to_s, :count => 2
  end
end
