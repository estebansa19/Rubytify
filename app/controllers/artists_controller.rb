class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  def index
    render json: Artist.all
  end

  def show
    render json: @artist
  end

  private

  def artist_params
    param.permit(:name)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end