class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string     :rank
      t.integer    :score
      t.float      :achievement_rate
      t.integer    :miss_count
      t.integer    :play_count
      t.string     :clear

      t.references :music, null: false

      t.timestamps null: false
    end
  end
end
