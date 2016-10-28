require 'rails_helper'

RSpec.describe "passengers/edit", type: :view do
  before(:each) do
    @passenger = assign(:passenger, Passenger.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :passport_number => "MyString"
    ))
  end

  it "renders the edit passenger form" do
    render

    assert_select "form[action=?][method=?]", passenger_path(@passenger), "post" do

      assert_select "input#passenger_first_name[name=?]", "passenger[first_name]"

      assert_select "input#passenger_last_name[name=?]", "passenger[last_name]"

      assert_select "input#passenger_email[name=?]", "passenger[email]"

      assert_select "input#passenger_passport_number[name=?]", "passenger[passport_number]"
    end
  end
end
