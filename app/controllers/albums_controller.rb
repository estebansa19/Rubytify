class AlbumsController < ApplicationController

  def index
    render json: { data: Album.all }
  end

  def show
    render json: { data: Album.find(params[:id]).select(:name, :spotify_url, :preview_url, :duration_ms, :explicit) }
  end
end