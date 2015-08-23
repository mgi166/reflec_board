require 'rails_helper'

RSpec.describe MusicScoreCrawling, type: :model do
  describe '#start' do
    context 'when failed in start' do
      let(:crawler) { build(:music_score_crawling, user: user) }
      let(:user) { create(:user) }

      it do
        # TODO: Stub phantomjs http request
        expect do
          crawler.start
        end.to raise_error Valanga::LoginError
      end

      it "status = `start_failed`" do
        begin
          crawler.start
        rescue
          expect(crawler.status).to eq "start_failed"
        end
      end
    end
  end
end
