class CommentsController < ApplicationController
  before_action :find_movie, only: [:new, :create]

  def new
  end

  def create
    @movie.comments.create!(message: comment_params[:message], user_id: comment_params[:user_id])

    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :user_id)
  end

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
end
