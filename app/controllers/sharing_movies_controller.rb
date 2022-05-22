class SharingMoviesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    movie = current_user.movies.new(movie_params)

    return redirect_to root_path, notice: 'Movie was successfully sharing.' if movie.save

    if movie.errors.added? :youtube_code, 'has already been taken'
      message = 'This movie has been shared'
    elsif movie.errors.added? :youtube_code, 'Invalid URL'
      message = 'Oops! Invalid URL'
    else
      message = 'Oops! Please try again'
    end
    redirect_to new_sharing_movies_path, alert: message
  end

  private

  def movie_params
    params.require(:movie)
          .permit(:name, :description, :youtube_code)
  end

  def format_youtube_code(url)
    url.split('watch?v=')[1].split('&')[0]
  end
end

