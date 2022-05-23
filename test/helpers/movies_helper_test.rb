require 'test_helper'

class MoviesHelperTest < ActionView::TestCase
  def setup
    users(:one).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_up)
    users(:two).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_down)
    users(:two).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_up)
    users(:one).user_movie_votes.create!(movie: movies(:two), vote_type: :vote_up)
  end

  test '#up_voted?' do
    assert up_voted?(users(:one), movies(:one))
  end

  test '#down_voted?' do
    assert down_voted?(users(:two), movies(:one))
  end
end
