require "test_helper"

class MovieVotesControllerTest < ActionDispatch::IntegrationTest
  test "#POST vote_up user vote up the movie" do
    sign_in(users(:one))

    assert_difference -> { UserMovieVote.count } do
      post movie_like_path(movies(:one), format: :turbo_stream)

      assert_response :success
      user_vote_movie = UserMovieVote.last
      assert_equal users(:one).id, user_vote_movie.user_id
      assert_equal movies(:one).id, user_vote_movie.movie_id
      assert_equal 'vote_up', user_vote_movie.vote_type
    end
  end

  test "#POST vote_down user vote down the movie" do
    sign_in(users(:one))

    assert_difference -> { UserMovieVote.count } do
      post movie_unlike_path(movies(:one), format: :turbo_stream)

      assert_response :success
      user_vote_movie = UserMovieVote.last
      assert_equal users(:one).id, user_vote_movie.user_id
      assert_equal movies(:one).id, user_vote_movie.movie_id
      assert_equal 'vote_down', user_vote_movie.vote_type
    end
  end

  test "#POST un voted if user toggle on it" do
    sign_in(users(:one))
    users(:one).user_movie_votes.create!(movie: movies(:one), vote_type: :vote_up)

    assert_difference -> { UserMovieVote.count }, -1 do
      post movie_unlike_path(movies(:one), format: :turbo_stream, un_vote: true)

      assert_response :success
    end
  end
end
