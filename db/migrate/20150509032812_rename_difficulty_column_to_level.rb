class RenameDifficultyColumnToLevel < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        rename_column :musics, :difficulty, :level
      end

      dir.down do
        rename_column :musics, :level, :difficulty
      end
    end
  end
end
