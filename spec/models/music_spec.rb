require 'rails_helper'

RSpec.describe Music, type: :model do
  describe 'scopes' do
    describe '.level_by' do
      let!(:music_1) { create(:music, :level_1) }
      let!(:music_2) { create(:music, :level_2) }
      let!(:music_3) { create(:music, :level_3) }
      let!(:music_4) { create(:music, :level_4) }

      context 'with multipul arguments' do
        it 'selects musics that have the argument level' do
          expect(Music.level_by('1', '4')).to eq(
            [music_1, music_4]
          )
        end
      end

      context 'with single arguments' do
        it 'selects a music that has the argument level' do
          expect(Music.level_by('1')).to eq(
            [music_1]
          )
        end

        context 'when the argument is instance of Array' do
          it 'selects musics that have the argument level' do
            expect(Music.level_by(%w(2 3))).to eq(
              [music_2, music_3]
            )
          end
        end
      end
    end
  end
end
