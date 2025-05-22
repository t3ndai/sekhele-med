require "application_system_test_case"

class LabUsersTest < ApplicationSystemTestCase
  setup do
    @lab_user = lab_users(:one)
  end

  test "visiting the index" do
    visit lab_users_url
    assert_selector "h1", text: "Lab users"
  end

  test "should create lab user" do
    visit lab_users_url
    click_on "New lab user"

    fill_in "Email", with: @lab_user.email
    fill_in "Name", with: @lab_user.name
    fill_in "Username", with: @lab_user.username
    click_on "Create Lab user"

    assert_text "Lab user was successfully created"
    click_on "Back"
  end

  test "should update Lab user" do
    visit lab_user_url(@lab_user)
    click_on "Edit this lab user", match: :first

    fill_in "Email", with: @lab_user.email
    fill_in "Name", with: @lab_user.name
    fill_in "Username", with: @lab_user.username
    click_on "Update Lab user"

    assert_text "Lab user was successfully updated"
    click_on "Back"
  end

  test "should destroy Lab user" do
    visit lab_user_url(@lab_user)
    click_on "Destroy this lab user", match: :first

    assert_text "Lab user was successfully destroyed"
  end
end
