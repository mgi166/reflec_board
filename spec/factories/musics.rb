FactoryGirl.define do
  factory :music do
    sequence(:name) { |n| "music_#{n}" }
    type "hard"
    score 1000
    achivement_rate 95.0
    clear_level 1
    play_count 0
    miss_count 2
  end

end
