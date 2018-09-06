require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user1 = users(:edgar)
    @user2 = users(:martin)
  end

  test "should redirect following when not logged in" do
    get following_user_path(@user1)
    assert_redirected_to new_user_session_path
  end

  test "should redirect followers when not logged in" do
    get followers_user_path(@user1)
    assert_redirected_to new_user_session_path
  end

  
end
