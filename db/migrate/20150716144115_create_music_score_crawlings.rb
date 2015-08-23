class CreateMusicScoreCrawlings < ActiveRecord::Migration
  def change
    create_table :music_score_crawlings do |t|
      t.datetime   :started_at
      t.datetime   :finished_at
      t.integer    :status, default: 0, null: false
      t.text       :feedback
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
