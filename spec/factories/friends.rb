FactoryGirl.define do
  factory :friend do
    sequence(:name) {|n| "friend_#{n}" }
    sequence(:rb_id) {|n| "id_#{n}" }
  end

end
