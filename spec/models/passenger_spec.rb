require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { is_expected.to belong_to(:booking) }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :passport_number }
  it { is_expected.to validate_presence_of :phone }
end
