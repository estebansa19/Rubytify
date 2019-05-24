class GenresController < ApplicationController
  before_action :set_genre

  def random_song
    render json: { data: @random_song }
  end

  private

  def set_genre
    artist = Artist.find { |a| a.genres.include?(params[:genre_id]) }
    @random_song = artist.songs.order("RANDOM()").first
  end
end