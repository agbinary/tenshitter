require "mocha/mini_test"
require "minitest/autorun"
require_relative "../../models/user"


class UserTest < Minitest::Test
  def test_sign_up
    users_count = user.size
    sign_up
    assert users_count + 1, user.size
  end
end