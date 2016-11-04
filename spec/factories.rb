FactoryGirl.define do
  factory :booking do
    cost 1
  end
  factory :passenger do
    name "MyString"
    email "MyString"
    passport_number "MyString"
  end
end
