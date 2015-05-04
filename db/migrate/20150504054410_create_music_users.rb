class CreateMusicUsers < ActiveRecord::Migration
  def change
    create_table :music_users do |t|
      t.references :music, null: false, index: true
      t.references :user,  null: false, index: true

      t.timestamps null: false
    end
  end
end
