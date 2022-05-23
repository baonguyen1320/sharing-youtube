class MovieVotesController < ApplicationController
  before_action :authenticate_user!, :set_movie

  def vote_up
    return un_voted if params[:un_vote]

    user_vote_movie = current_user.user_movie_votes.new(movie: @movie, vote_type: :vote_up)
    respond_to do |format|
      if user_vote_movie.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("vote-section-#{@movie.id}", partial: 'movies/votes', locals: { movie: @movie.reload })
        end
      else
        redirect_to root_path, alert: user_vote_movie.errors.full_messages
      end
    end
  end

  def vote_down
    return un_voted if params[:un_vote]

    user_vote_movie = current_user.user_movie_votes.new(movie: @movie, vote_type: :vote_down)
    respond_to do |format|
      if user_vote_movie.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("vote-section-#{@movie.id}", partial: 'movies/votes', locals: { movie: @movie.reload })
        end
      else
        redirect_to root_path, alert: user_vote_movie.errors.full_messages
      end
    end
  end

  def un_voted
    current_user.destroy_voted_movie(@movie)
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("vote-section-#{@movie.id}", partial: 'movies/votes', locals: { movie: @movie.reload })
      end
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
