require "test_helper"

class AppAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get app_admin_index_url
    assert_response :success
  end
end
