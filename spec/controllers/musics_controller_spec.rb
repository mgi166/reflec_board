require 'rails_helper'

RSpec.describe MusicsController, type: :controller do
  let(:valid_session) { {} }
  let(:user) { create :user }

  # NOTE: Only by create, it is not a subclass instance that is specified in the Single Table Inheritance(STI)
  let!(:music_1) { create(:music, :level_5) }
  let!(:music_2) { create(:music, :level_6) }
  let!(:music_3) { create(:music, :level_7) }
  let!(:music_user) do
    create(:music_user, music: music_1, user: user)
    create(:music_user, music: music_2, user: user)
  end

  before do
    login user
  end

  describe "GET #index" do
    it "assigns only musics that associated to user as @musics" do
      get :index, {}, valid_session
      expect(assigns(:musics)).to eq([music_1, music_2])
    end

    context 'when seaches name' do
      it 'assigns only musics that matches query' do
        get :index, { q: music_1.name }, valid_session
        expect(assigns(:musics)).to eq [music_1]
      end
    end

    context 'when searches level' do
      it 'assigns only musics that matches level' do
        get :index, { level: ['6'] }, valid_session
        expect(assigns(:musics)).to eq [music_2]
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested music that associated to user as @music" do
      get :show, { id: music_1.to_param }, valid_session
      expect(assigns(:music)).to eq(music_1)
    end

    it do
      get :show, { id: music_3.to_param }, valid_session
      expect(response).to have_http_status 404
    end
  end
end
