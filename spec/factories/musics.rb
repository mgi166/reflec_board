FactoryGirl.define do
  factory :music do
    sequence(:name) { |n| "music_#{n}" }
    type "Music::HardMusic"
    difficulty '10+'
    score 1000
    achivement_rate 95.0
    clear_level 1
    play_count 0
    miss_count 2

    Settings.difficulty.each do |d|
      trait "difficulty_#{d}".to_sym do
        difficulty d
      end
    end
  end

end
