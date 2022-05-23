class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    @pagy, @movies = pagy(Movie.all.order(created_at: :desc).includes(:user), items: 5)

    render partial: 'movies/scrollable_list' if params[:page].present?
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :description, :youtube_code)
  end
end
