class AlbumsController < ApplicationController
  before_action :set_artist

  def index
    render json: @artist.albums
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end
end