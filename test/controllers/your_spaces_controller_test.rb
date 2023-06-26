require "test_helper"

class YourSpacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get your_spaces_new_url
    assert_response :success
  end
end
