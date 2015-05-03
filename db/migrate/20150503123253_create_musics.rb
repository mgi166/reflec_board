class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string  :name,        null: false
      t.string  :type,        null: false
      t.integer :score
      t.float   :achivement_rate
      t.integer :clear_level, null: false, default: 0
      t.integer :play_count,  null: false, default: 0
      t.integer :miss_count,  null: false, default: 0

      t.timestamps null: false
    end
  end
end
