require 'test_helper'

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get languages_edit_url
    assert_response :success
  end

  test "should get update" do
    get languages_update_url
    assert_response :success
  end

end
