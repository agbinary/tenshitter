require_relative "../test_helper"
require_relative "../../models/user"
require_relative "../../models/tenshi"
require_relative "../../models/relationship"


class UserTest < MiniTest::Unit::TestCase
  def test_tenshee
    user = User.create(name: "Angela G", email: "angela@hotmail.com", password: "qwerty", username: "angie")
    count = user.tenshis.count
    user.tenshee("Hola")

    assert count + 1, user.tenshis.count
    assert "Hola", user.tenshis.last.message
  end

  def test_retenshi
    user = User.create(name: "Angela M", email: "angel@hotmail.com", password: "asdfg", username: "angela")
    count = user.tenshis.count
    user.retenshi(1)

    assert count + 1, user.tenshis.count
  end

  def test_reply
    user = User.find(2)
    count = user.tenshis.count
    user.reply("Como estas?", "1")

    assert count + 1, user.tenshis.count
  end

  def test_follow
    user = User.find(1)
    count = user.followers.count
    user.follow(2)

    assert count + 1, user.followers.count
  end
end
