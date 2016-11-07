FactoryGirl.define do
  factory :passenger do
    name Faker::Name.name
    passport_number Faker::Code.asin
    phone Faker::PhoneNumber.phone_number
    booking
  end
end
