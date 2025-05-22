require "application_system_test_case"

class LabBranchesTest < ApplicationSystemTestCase
  setup do
    @lab_branch = lab_branches(:one)
  end

  test "visiting the index" do
    visit lab_branches_url
    assert_selector "h1", text: "Lab branches"
  end

  test "should create lab branch" do
    visit lab_branches_url
    click_on "New lab branch"

    fill_in "Lab", with: @lab_branch.lab_id
    fill_in "Name", with: @lab_branch.name
    click_on "Create Lab branch"

    assert_text "Lab branch was successfully created"
    click_on "Back"
  end

  test "should update Lab branch" do
    visit lab_branch_url(@lab_branch)
    click_on "Edit this lab branch", match: :first

    fill_in "Lab", with: @lab_branch.lab_id
    fill_in "Name", with: @lab_branch.name
    click_on "Update Lab branch"

    assert_text "Lab branch was successfully updated"
    click_on "Back"
  end

  test "should destroy Lab branch" do
    visit lab_branch_url(@lab_branch)
    click_on "Destroy this lab branch", match: :first

    assert_text "Lab branch was successfully destroyed"
  end
end
