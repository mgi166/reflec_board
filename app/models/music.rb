class Music < ActiveRecord::Base
  has_many :music_users
  has_many :users, through: :music_users

  scope :by_difficulty, -> (*difficulty) { where(difficulty: [difficulty].flatten) }
end
