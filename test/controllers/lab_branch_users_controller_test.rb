require "test_helper"

class LabBranchUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_branch_user = lab_branch_users(:one)
  end

  test "should get index" do
    get lab_branch_users_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_branch_user_url
    assert_response :success
  end

  test "should create lab_branch_user" do
    assert_difference("LabBranchUser.count") do
      post lab_branch_users_url, params: { lab_branch_user: { address: @lab_branch_user.address, email: @lab_branch_user.email, first_name: @lab_branch_user.first_name, lab_branch_id: @lab_branch_user.lab_branch_id, last_names: @lab_branch_user.last_names, middle_names: @lab_branch_user.middle_names, phone: @lab_branch_user.phone, role_type: @lab_branch_user.role_type } }
    end

    assert_redirected_to lab_branch_user_url(LabBranchUser.last)
  end

  test "should show lab_branch_user" do
    get lab_branch_user_url(@lab_branch_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_branch_user_url(@lab_branch_user)
    assert_response :success
  end

  test "should update lab_branch_user" do
    patch lab_branch_user_url(@lab_branch_user), params: { lab_branch_user: { address: @lab_branch_user.address, email: @lab_branch_user.email, first_name: @lab_branch_user.first_name, lab_branch_id: @lab_branch_user.lab_branch_id, last_names: @lab_branch_user.last_names, middle_names: @lab_branch_user.middle_names, phone: @lab_branch_user.phone, role_type: @lab_branch_user.role_type } }
    assert_redirected_to lab_branch_user_url(@lab_branch_user)
  end

  test "should destroy lab_branch_user" do
    assert_difference("LabBranchUser.count", -1) do
      delete lab_branch_user_url(@lab_branch_user)
    end

    assert_redirected_to lab_branch_users_url
  end
end
