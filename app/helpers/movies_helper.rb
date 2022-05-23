module MoviesHelper
  def total_vote_ups_of(movie)
    movie.user_vote_ups.count
  end

  def total_vote_downs_of(movie)
    movie.user_vote_downs.count
  end

  def up_voted?(user, movie)
    movie.vote_up_by(user).any?
  end

  def down_voted?(user, movie)
    movie.vote_down_by(user).any?
  end
end
