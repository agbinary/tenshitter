<<<<<<< HEAD
require_relative "../test_helper"
require_relative "../../models/user"
require_relative "../../models/tenshi"
require_relative "../../models/relationship"


class UserTest < Minitest::Test
  def test_tenshee
    user = User.create(name: "Angela G", email: "angela@hotmail.com", password: "qwerty", username: "angie")
    count = user.tenshis.count
    user.tenshee("Hola!")

    assert_equal count + 1, user.tenshis.count
    assert_equal "Hola!", user.tenshis.last.message
  end

  def test_retenshee
    user1 = User.create(name: "Angela M", email: "angel@hotmail.com", password: "asdfg", username: "angela")
    user2 = User.find(1)
    user1.save!
    count = user1.tenshis.count
    tenshi = user1.tenshee("Hola!")
    user2.retenshee(tenshi.id)

    assert_equal count + 1, user1.tenshis.count
    assert_equal "RT @angela: Hola!", user2.tenshis.last.message
  end

  def test_reply
    user1 = User.find(1)
    user2 = User.find(2)
    count = user1.tenshis.count
    tenshi = user1.tenshee("Hola!")
    user2.reply("Como estas?", tenshi.id)

    assert_equal count + 1, user1.tenshis.count
    assert_equal "RE: Como estas?", user2.tenshis.last.message
  end

  def test_follow
    user1 = User.find(1)
    user2 = User.find(2)
    count = user1.followers.count
    user2.follow(user1)

    assert_equal count + 1, user1.followers.count
  end

  def test_unfollow
    user1 = User.find(1)
    user2 = User.find(2)
    count = user1.followers.count
    user2.unfollow(user1)

    assert_equal count - 1, user1.followers.count
  end
end
=======
require_relative "../test_helper"
require_relative "../../models/user"
require_relative "../../models/tenshi"
require_relative "../../models/relationship"


class UserTest < MiniTest::Unit::TestCase
  def test_tenshee
    user = User.create(name: "Angela G", email: "angela@hotmail.com", password: "qwerty", username: "angie")
    count = user.tenshis.count
    user.tenshee("Hola!")

    assert_equal count + 1, user.tenshis.count
    assert_equal "Hola!", user.tenshis.last.message
  end

  def test_retenshee
    user1 = User.create(name: "Angela M", email: "angel@hotmail.com", password: "asdfg", username: "angela")
    user2 = User.find(1)
    user1.save!
    count = user1.tenshis.count
    tenshi = user1.tenshee("Hola!")
    user2.retenshee(tenshi.id)

    assert_equal count + 1, user1.tenshis.count
    assert_equal "RT @angela: Hola!", user2.tenshis.last.message
  end

  def test_reply
    user1 = User.find(1)
    user2 = User.find(2)
    count = user1.tenshis.count
    tenshi = user1.tenshee("Hola!")
    user2.reply("Como estas?", tenshi.id)

    assert_equal count + 1, user1.tenshis.count
    assert_equal "RE: Como estas?", user2.tenshis.last.message
  end

  def test_follow
    user1 = User.find(1)
    user2 = User.find(2)
    count = user1.followers.count
    user2.follow(user1)

    assert_equal count + 1, user1.followers.count
  end

  def test_unfollow
    user1 = User.find(1)
    user2 = User.find(2)
    count = user1.followers.count
    user2.unfollow(user1)

    assert_equal count - 1, user1.followers.count
  end
end
>>>>>>> c18d6aa0316fffec063e8484590e00b96fcb5f75
