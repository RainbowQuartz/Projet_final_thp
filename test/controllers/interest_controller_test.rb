require 'test_helper'

class InterestControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get interest_edit_url
    assert_response :success
  end

end
