# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "MyString"
    last_name "MyString"
    middle_name "MyString"
    birthday "2015-01-18 14:19:37"
    address "MyString"
    phone "MyString"
  end
end
