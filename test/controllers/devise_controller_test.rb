require 'test_helper'

class DeviseControllerTest < ActionDispatch::IntegrationTest

    test "Should get signup" do
      get new_user_registration_path
      assert_response :success
    end

    test "Should get login" do
      get new_user_session_path
    end

end
