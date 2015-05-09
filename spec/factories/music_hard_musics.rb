FactoryGirl.define do
  factory :hard_music, class: 'Music::HardMusic' do
    sequence(:name) { |n| "hard_music_#{n}" }
    type "Music::HardMusic"
    difficulty '10+'
    score { rand(3000) }
    achivement_rate { [70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0].sample }
    clear_level { (1..4).to_a.sample }
    play_count { (0..100).to_a.sample }
    miss_count { (0..20).to_a.sample }
  end
end
