require "test_helper"

class LabBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lab_branch = lab_branches(:one)
  end

  test "should get index" do
    get lab_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_lab_branch_url
    assert_response :success
  end

  test "should create lab_branch" do
    assert_difference("LabBranch.count") do
      post lab_branches_url, params: { lab_branch: { lab_id: @lab_branch.lab_id, name: @lab_branch.name } }
    end

    assert_redirected_to lab_branch_url(LabBranch.last)
  end

  test "should show lab_branch" do
    get lab_branch_url(@lab_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_lab_branch_url(@lab_branch)
    assert_response :success
  end

  test "should update lab_branch" do
    patch lab_branch_url(@lab_branch), params: { lab_branch: { lab_id: @lab_branch.lab_id, name: @lab_branch.name } }
    assert_redirected_to lab_branch_url(@lab_branch)
  end

  test "should destroy lab_branch" do
    assert_difference("LabBranch.count", -1) do
      delete lab_branch_url(@lab_branch)
    end

    assert_redirected_to lab_branches_url
  end
end
