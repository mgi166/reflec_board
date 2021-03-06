# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  user = FactoryGirl.create :user

  20.times do
    m = FactoryGirl.create :music
    FactoryGirl.create(:music_user, music: m, user: user)
  end

  10.times do
    f = FactoryGirl.create(:friend)
    FactoryGirl.create(:friend_user, friend: f, user: user)
  end
end
