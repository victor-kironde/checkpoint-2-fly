require 'rails_helper'

RSpec.describe Flight, type: :model do

    let(:flight) { FactoryGirl.create(:flight)}

    it { should validate_presence_of(:departure) }
    it { should validate_presence_of(:flight_number) }
    it { should validate_presence_of(:arrival) }

end
