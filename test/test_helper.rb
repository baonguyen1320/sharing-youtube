ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'active_support/testing/method_call_assertions'

class ActiveSupport::TestCase
  include ActionMailer::TestHelper
  include ActiveSupport::Testing::MethodCallAssertions
  include ActionDispatch::TestProcess


  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def sign_in(resource, scope: :users)
    super(resource, scope:)
  end
end
