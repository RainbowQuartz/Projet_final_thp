require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should follow and unfollow a user" do
    edgar  = users(:edgar)
    martin   = users(:martin)
    assert_not edgar.following?(martin)
    edgar.follow(martin)
    assert edgar.following?(martin)
    assert martin.followers.include?(edgar)
    edgar.unfollow(martin)
    assert_not edgar.following?(martin)
  end
end
