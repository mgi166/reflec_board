require 'rails_helper'

RSpec.feature "Musics", type: :feature do
  let!(:user)    { create :user }
  let!(:music_1) { create(:hard_music) }
  let!(:music_2) { create(:hard_music) }
  let!(:music_3) { create(:hard_music) }
  let!(:music_user) do
    create(:music_user, user: user, music: music_1)
    create(:music_user, user: user, music: music_2)
    create(:music_user, user: user, music: music_3)
  end

  describe '/musics' do
    context 'user does not logged in' do
      before do
        visit musics_path
      end

      it do
        expect(page).to have_selector('div.alert-danger')
      end

      it 'redirects to login_path' do
        expect(current_path).to eq login_path
      end
    end

    context 'user already logged in' do
      before do
        login user
        visit musics_path
      end

      it 'redirects musics_path' do
        expect(current_path).to eq musics_path
      end
    end
  end
end
