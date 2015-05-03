class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name, null: false
      t.string :rb_id, null: false
    end
  end
end
