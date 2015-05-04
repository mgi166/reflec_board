class MusicsController < ApplicationController
  before_action :set_music, only: [:show]

  # GET /musics
  # GET /musics.json
  def index
    @musics = current_user.musics
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    unless @music
      render status: 404
    end
  end

  private

  def set_music
    @music = current_user.musics.find_by(id: params[:id])
  end
end
