FactoryGirl.define do
  factory :booking do
    cost 1
  end
  factory :passenger do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    passport_number "MyString"
  end
end
