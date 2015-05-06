class AddColumnDifficultyToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :difficulty, :string, null: false, after: :type
  end
end
