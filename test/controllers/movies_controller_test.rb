require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "#Get return index page" do
    get root_path

    assert_response :success
  end
end
