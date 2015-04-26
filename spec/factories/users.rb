FactoryGirl.define do
  factory :user do
    username 'test'
    email 'test@example.com'
    password 'password'

    trait :blank_name_and_email do
      username ''
      email ''
    end
  end
end
