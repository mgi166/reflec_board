class Music < ActiveRecord::Base
  has_many :music_users
  has_many :users, through: :music_users
  has_many :scores

  scope :level_by, -> (*levels) { where(level: [levels].flatten) }
end
