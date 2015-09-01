# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :achievement do
    achievable_type "MyString"
    achievable_id 1
    achievement_type_id 1
    description "MyText"
    date "2015-09-01 08:34:53"
  end
end
