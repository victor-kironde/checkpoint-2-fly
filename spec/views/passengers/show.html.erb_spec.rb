require 'rails_helper'

RSpec.describe "passengers/show", type: :view do
  before(:each) do
    @passenger = assign(:passenger, Passenger.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :passport_number => "Passport Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Passport Number/)
  end
end
