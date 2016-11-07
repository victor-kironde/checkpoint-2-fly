FactoryGirl.define do
  factory :flight do
    origin { Faker::Code.asin }
    destination { Faker::Code.asin }
    departure Faker::Date.forward(12)
    distance Faker::Number.positive
    duration Faker::Number.between(1, 12)
    price Faker::Number.positive
    airline
  end
end
