class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end

  has_many :music_users
  has_many :musics, through: :music_users

  has_many :friend_users
  has_many :friends, through: :friend_users

  has_many :music_score_crawlings
end
