require "test_helper"

class SharingMoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in(users(:one))
  end

  test '#GET new redirect sharing movie page' do
    get new_sharing_movies_path

    assert_response :success
    assert_includes response.body, 'Youtube URL'
  end

  test '#create share new movie successful' do
    params =
      {
        movie: {
          name:         'Test Name',
          description:  'This is a description',
          youtube_code: 'https://www.youtube.com/watch?v=FZS0CVd6XD8&ab_channel=RIWON%27sRoom%E2%9C%93'
        }
      }

    assert_difference -> { Movie.count } do
      post sharing_movies_path(params)

      assert_redirected_to root_path
      movie = Movie.last
      assert_equal 'Test Name', movie.name
      assert_equal 'This is a description', movie.description
      assert_equal 'FZS0CVd6XD8', movie.youtube_code
    end
  end

  test '#create share the exist movie' do
    params =
      {
        movie: {
          name:         'Test Name',
          description:  'This is a description',
          youtube_code: 'https://www.youtube.com/watch?v=abcdef&ab_channel=RIWON%27sRoom%E2%9C%93'
        }
      }

    assert_no_difference -> { Movie.count } do
      post sharing_movies_path(params)

      assert_redirected_to new_sharing_movies_path
      assert_equal 'This movie has been shared', flash[:alert]
    end
  end
end
