FactoryGirl.define do
  factory :user do
    name 'test'
    email 'test@example.com'
    password 'test'

    trait :blank_name_and_email do
      name ''
      email ''
    end
  end
end
