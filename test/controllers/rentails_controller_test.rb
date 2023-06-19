require "test_helper"

class RentailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rentails_new_url
    assert_response :success
  end
end
