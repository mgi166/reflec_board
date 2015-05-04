class CreateFriendUsers < ActiveRecord::Migration
  def change
    create_table :friend_users do |t|
      t.references :friend, index: true, null: false
      t.references :user,   index: true, null: false

      t.timestamps null: false
    end
  end
end
