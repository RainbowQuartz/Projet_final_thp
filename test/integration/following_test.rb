require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest

  def setup
    @user1 = users(:edgar)
    @user2 = users(:martin)
    sign_in(@user1)  
  end

  test "following page" do
    get following_user_path(@user1)
    assert_not @user.following.empty?
    assert_match @user.following.count.to_s, response.body
    @user1.following.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "followers page" do
    get followers_user_path(@user1)
    assert_not @user.followers.empty?
    assert_match @user.followers.count.to_s, response.body
    @user1.followers.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "should follow a user the standard way" do
    assert_difference '@user1.following.count', 1 do
      post relationships_path, params: { followed_id: @user2.id }
    end
  end

  test "should follow a user with Ajax" do
    assert_difference '@user1.following.count', 1 do
      post relationships_path, xhr: true, params: { followed_id: @user2.id }
    end
  end

  test "should unfollow a user the standard way" do
    @user.follow(@user2)
    relationship = @user1.active_relationships.find_by(followed_id: @user2.id)
    assert_difference '@user.following.count', -1 do
      delete relationship_path(relationship)
    end
  end

  test "should unfollow a user with Ajax" do
    @user1.follow(@user2)
    relationship = @user1.active_relationships.find_by(followed_id: @user2.id)
    assert_difference '@user.following.count', -1 do
      delete relationship_path(relationship), xhr: true
    end
  end
end