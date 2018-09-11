require 'test_helper'

class InterestControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get interest_edit_path
    assert_response :success
  end

end
