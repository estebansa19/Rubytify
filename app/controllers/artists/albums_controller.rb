module Artists
  class AlbumsController < ApplicationController
    before_action :set_artist

    def show
      render json:  { data: @artist.albums.select(:id, :name, :image, :spotify_url, :total_tracks) }
    end

    private

    def set_artist
      @artist = Artist.find(params[:id])
    end
  end
end
