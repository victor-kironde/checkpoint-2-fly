require "rails_helper"

RSpec.describe Flight, type: :model do
  let(:flight) { FactoryGirl.create(:flight) }
  it { is_expected.to validate_presence_of(:origin) }
  it { is_expected.to validate_presence_of(:destination) }
  it { is_expected.to validate_presence_of(:departure) }
  it { is_expected.to validate_presence_of(:distance) }
  it { is_expected.to validate_presence_of(:duration) }
  it { is_expected.to validate_presence_of(:price) }
  it { is_expected.to belong_to(:airline) }
  it { is_expected.to have_many(:bookings) }
end
