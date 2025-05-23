require "application_system_test_case"

class LabBranchUsersTest < ApplicationSystemTestCase
  setup do
    @lab_branch_user = lab_branch_users(:one)
  end

  test "visiting the index" do
    visit lab_branch_users_url
    assert_selector "h1", text: "Lab branch users"
  end

  test "should create lab branch user" do
    visit lab_branch_users_url
    click_on "New lab branch user"

    fill_in "Address", with: @lab_branch_user.address
    fill_in "Email", with: @lab_branch_user.email
    fill_in "First name", with: @lab_branch_user.first_name
    fill_in "Lab branch", with: @lab_branch_user.lab_branch_id
    fill_in "Last names", with: @lab_branch_user.last_names
    fill_in "Middle names", with: @lab_branch_user.middle_names
    fill_in "Phone", with: @lab_branch_user.phone
    fill_in "Role type", with: @lab_branch_user.role_type
    click_on "Create Lab branch user"

    assert_text "Lab branch user was successfully created"
    click_on "Back"
  end

  test "should update Lab branch user" do
    visit lab_branch_user_url(@lab_branch_user)
    click_on "Edit this lab branch user", match: :first

    fill_in "Address", with: @lab_branch_user.address
    fill_in "Email", with: @lab_branch_user.email
    fill_in "First name", with: @lab_branch_user.first_name
    fill_in "Lab branch", with: @lab_branch_user.lab_branch_id
    fill_in "Last names", with: @lab_branch_user.last_names
    fill_in "Middle names", with: @lab_branch_user.middle_names
    fill_in "Phone", with: @lab_branch_user.phone
    fill_in "Role type", with: @lab_branch_user.role_type
    click_on "Update Lab branch user"

    assert_text "Lab branch user was successfully updated"
    click_on "Back"
  end

  test "should destroy Lab branch user" do
    visit lab_branch_user_url(@lab_branch_user)
    click_on "Destroy this lab branch user", match: :first

    assert_text "Lab branch user was successfully destroyed"
  end
end
