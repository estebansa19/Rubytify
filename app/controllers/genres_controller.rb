class GenresController < ApplicationController
  before_action :set_genre, only: [:random_song]

  def list
    render json: { data: Artist.all.map(&:genres).flatten.uniq }
  end

  def random_song
    render json: { data: @data }
  end

  private

  def set_genre
    artist = Artist.find { |a| a.genres.include?(params[:name]) }
    @data = artist ? artist.songs.order("RANDOM()").first : { error: "No se encontró un artista"}
  end
end