require "test_helper"

class UsereControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get usere_show_url
    assert_response :success
  end

  test "should get edit" do
    get usere_edit_url
    assert_response :success
  end
end
