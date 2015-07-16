class CreateMusicScoreCrawlings < ActiveRecord::Migration
  def change
    create_table :music_score_crawlings do |t|
      t.timestamps :started_at
      t.timestamps :finished_at
      t.integer    :status
      t.references :music_id, null: false
      t.timestamps null: false
    end
  end
end
