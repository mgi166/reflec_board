FactoryGirl.define do
  factory :music do
    sequence(:name) { |n| "music_#{n}" }
    difficulty 1
    level '10+'
    score 1000
    achivement_rate 95.0
    clear_level 1
    play_count 0
    miss_count 2

    Settings.music.levels.each do |l|
      trait "level_#{l}".to_sym do
        level l
      end
    end
  end
end
