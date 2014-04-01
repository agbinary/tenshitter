require_relative "../test_helper"
require_relative "../../models/user"
require_relative "../../models/tenshi"
require_relative "../../models/relationship"


class UserTest < MiniTest::Unit::TestCase
  def test_tenshi
    u = User.create(name: "Angela Guette", email: "ang3l_gu@hotmail.com", password: "qwerty", username: "angelaguette")
    t = u.tenshis.create(:message => "Hola")
    t.save

  end
end
