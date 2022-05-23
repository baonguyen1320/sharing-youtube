module MoviesHelper
  def up_voted?(user, movie)
    movie.vote_up_by(user).any?
  end

  def down_voted?(user, movie)
    movie.vote_down_by(user).any?
  end
end
