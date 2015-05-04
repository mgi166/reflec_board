class Music < ActiveRecord::Base
  has_many :music_users
  has_many :users, through: :music_users
end
