# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "MyString"
    section_id 1
    subject_id 1
    student_id 1
    timeofday "MyString"
  end
end
