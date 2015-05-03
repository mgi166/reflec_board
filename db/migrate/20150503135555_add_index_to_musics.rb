class AddIndexToMusics < ActiveRecord::Migration
  def change
    add_index :musics, :name, unique: true
  end
end
