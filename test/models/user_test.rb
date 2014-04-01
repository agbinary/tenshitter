require_relative "../test_helper"
require_relative "../../models/user"
require_relative "../../models/tenshi"
require_relative "../../models/relationship"


class UserTest < MiniTest::Unit::TestCase
  def test_tenshee
    user = User.create(name: "Angela Guette", email: "ang3l_gu@hotmail.com", password: "qwerty", username: "angelaguette")
    user.tenshee("Hola")

    assert 1, user.tenshis.count
    assert "Hola", user.tenshis.last.message
  end
end
