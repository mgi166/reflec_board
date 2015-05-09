class ChangeTypeColumnToMusics < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        change_table :musics do |t|
          t.change :type, :integer
          t.rename :type, :difficulty
        end
      end

      dir.down do
        change_table :musics do |t|
          t.change :difficulty, :string
          t.rename :difficulty, :type
        end
      end
    end
  end
end
