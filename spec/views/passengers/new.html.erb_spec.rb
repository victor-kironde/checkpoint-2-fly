require 'rails_helper'

RSpec.describe "passengers/new", type: :view do
  before(:each) do
    assign(:passenger, Passenger.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :passport_number => "MyString"
    ))
  end

  it "renders new passenger form" do
    render

    assert_select "form[action=?][method=?]", passengers_path, "post" do

      assert_select "input#passenger_first_name[name=?]", "passenger[first_name]"

      assert_select "input#passenger_last_name[name=?]", "passenger[last_name]"

      assert_select "input#passenger_email[name=?]", "passenger[email]"

      assert_select "input#passenger_passport_number[name=?]", "passenger[passport_number]"
    end
  end
end
