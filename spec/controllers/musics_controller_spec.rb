require 'rails_helper'

RSpec.describe MusicsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all musics as @musics" do
      music = Music.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:musics)).to eq([music])
    end
  end

  describe "GET #show" do
    it "assigns the requested music as @music" do
      music = Music.create! valid_attributes
      get :show, {:id => music.to_param}, valid_session
      expect(assigns(:music)).to eq(music)
    end
  end
end
