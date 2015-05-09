class Friend < ActiveRecord::Base
  has_many :friend_users
  has_many :users, through: :friend_users
end
