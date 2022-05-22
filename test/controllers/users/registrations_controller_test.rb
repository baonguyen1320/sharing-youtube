require 'test_helper'

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test '#GET new redirect sign up page' do
    get new_user_registration_path

    assert_includes response.body, 'Sign up'
  end

  test 'POST #create create new account successful' do
    params =
      {
        user: {
          email:                 'test12@itviec.com',
          password:              '12345b@B',
          password_confirmation: '12345b@B'
        }
      }

    assert_difference -> { User.count } do
      post user_registration_path(params)

      assert_redirected_to root_path
      assert_equal 'Welcome! You have signed up successfully.', flash[:notice]
    end
  end

  test 'POST #create create new account with email exist before' do
    User.create!(
      email: 'test12@itviec.com',
      password: '12345Aa@')

    params =
      {
        user: {
          email:                 'test12@itviec.com',
          password:              '12345b@B',
          password_confirmation: '12345b@B'
        }
      }

    assert_no_difference -> { User.count } do
      post user_registration_path(params)

      assert_equal 'Email has already been taken', flash[:alert]
    end
  end

  test 'POST #create create new account with confirmation not match the password' do
    params =
      {
        user: {
          email:                 'test12@itviec.com',
          password:              '12345b@B',
          password_confirmation: '12345a@A'
        }
      }

    assert_no_difference -> { User.count } do
      post user_registration_path(params)

      assert_equal "Password confirmation doesn't match Password", flash[:alert]
    end
  end
end
