class MusicScoreCrawling < ActiveRecord::Base
  belongs_to :user

  enum status: %w(pending start_failed start_successed)

  def start
    self.started_at = Time.current

    @valanga = Valanga::Client.new

    start_successed!
  rescue
    start_failed!
    raise $!
  end
end
