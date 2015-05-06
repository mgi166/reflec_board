class MusicsController < ApplicationController
  before_action :set_music, only: [:show]

  # GET /musics
  # GET /musics.json
  def index
    if search_query.present?
      # FIXME: Not only To be searchable by name but also such as artist name, etc..
      @musics = current_user.musics.where("name LIKE ?", "%#{search_query[:q]}%")
    else
      @musics = current_user.musics
    end

    @musics = @musics.page(params[:page]).per(15)
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    # FIXME: render 404 page
    unless @music
      render status: 404
    end
  end

  private

  def set_music
    @music = current_user.musics.find_by(id: params[:id])
  end

  def search_query
    params.permit(:q, difficulty: [])
  end
end
