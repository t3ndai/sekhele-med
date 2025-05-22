require "test_helper"

class LabUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_user = lab_users(:one)
  end

  test "should get index" do
    get lab_users_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_user_url
    assert_response :success
  end

  test "should create lab_user" do
    assert_difference("LabUser.count") do
      post lab_users_url, params: { lab_user: { email: @lab_user.email, name: @lab_user.name, username: @lab_user.username } }
    end

    assert_redirected_to lab_user_url(LabUser.last)
  end

  test "should show lab_user" do
    get lab_user_url(@lab_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_user_url(@lab_user)
    assert_response :success
  end

  test "should update lab_user" do
    patch lab_user_url(@lab_user), params: { lab_user: { email: @lab_user.email, name: @lab_user.name, username: @lab_user.username } }
    assert_redirected_to lab_user_url(@lab_user)
  end

  test "should destroy lab_user" do
    assert_difference("LabUser.count", -1) do
      delete lab_user_url(@lab_user)
    end

    assert_redirected_to lab_users_url
  end
end
