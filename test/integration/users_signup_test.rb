require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: { user: {  first_name:  "",
                                          last_name: "",
                                          postal_code: "",
                                          city: "",
                                          country: "",
                                          bio: "",
                                          birthdate: "",
                                          email: "user@invalid",
                                          password:              "foo",
                                          password_confirmation: "bar" } }
    end
  end

  test "Valid signup information" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: {  first_name:  "Henry",
                                          last_name: "George",
                                          postal_code: "75000",
                                          city: "Paris",
                                          country: "France",
                                          bio: "Informaticien",
                                          birthdate: '01/01/2010',
                                          email: "user@valid",
                                          password:              "6lettres",
                                          password_confirmation: "6lettres" } }
    end
  end

end
