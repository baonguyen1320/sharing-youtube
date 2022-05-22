require 'test_helper'

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  test '#GET new redirect registration page if account not exist' do
    get new_user_session_path(commit: 'signInMenuBar')

    assert_redirected_to new_user_registration_path
  end

  test '#GET new login' do
    get new_user_session_path

    assert_response :success
    assert_includes response.body, 'Log in'
  end

  test '#POST create login successful' do
    User.create!(
      email: 'test12@itviec.com',
      password: '12345Aa@')

    params =
      {
        user: {
          email:    'test12@itviec.com',
          password: '12345Aa@'
        }
      }

    post user_session_path(params)

    assert_redirected_to root_path
    assert_equal 'Signed in successfully.', flash[:notice]
  end

  test '#POST create login failed' do
    User.create!(
      email: 'test12@itviec.com',
      password: '12345Aa@')

    params =
      {
        user: {
          email:    'test12@itviec.com',
          password: '12345b@B'
        }
      }

    post user_session_path(params)

    assert_equal 'Invalid Email or password.', flash[:alert]
    assert_includes response.body, 'Log in'
  end

  test '#DELETE destroy user logout' do
    sign_in(users(:one))

    delete destroy_user_session_path

    assert_equal 'Signed out successfully.', flash[:notice]
  end
end
