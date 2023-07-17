require "test_helper"

class WeekliesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get weeklies_edit_url
    assert_response :success
  end
end
