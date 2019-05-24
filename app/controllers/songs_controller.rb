class SongsController < ApplicationController
  before_action :set_album_id

  def index
    render json: { data: @album.songs.all.select(:id, :name, :spotify_url, :preview_url, :duration_ms, :explicit) }
  end

  private

  def set_album_id
    @album = Album.find(params[:album_id])
  end
end