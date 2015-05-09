require 'rails_helper'

RSpec.describe Music, type: :model do
  describe 'scopes' do
    describe '.by_difficulty' do
      let!(:music_1) do
        m = create(:music, :difficulty_1)
        m.becomes(m.type.constantize)
      end
      let!(:music_2) do
        m = create(:music, :difficulty_2)
        m.becomes(m.type.constantize)
      end
      let!(:music_3) do
        m = create(:music, :difficulty_3)
        m.becomes(m.type.constantize)
      end
      let!(:music_4) do
        m = create(:music, :difficulty_4)
        m.becomes(m.type.constantize)
      end

      context 'with multipul arguments' do
        it 'selects musics that have the argument difficulty' do
          expect(Music.by_difficulty('1', '4')).to eq(
            [music_1, music_4]
          )
        end
      end

      context 'with single arguments' do
        it 'selects a music that has the argument difficulty' do
          expect(Music.by_difficulty('1')).to eq(
            [music_1]
          )
        end

        context 'when the argument is instance of Array' do
          it 'selects musics that have the argument difficulty' do
            expect(Music.by_difficulty(%w(2 3))).to eq(
              [music_2, music_3]
            )
          end
        end
      end
    end
  end
end
