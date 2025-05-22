require "application_system_test_case"

class ReferrersTest < ApplicationSystemTestCase
  setup do
    @referrer = referrers(:one)
  end

  test "visiting the index" do
    visit referrers_url
    assert_selector "h1", text: "Referrers"
  end

  test "should create referrer" do
    visit referrers_url
    click_on "New referrer"

    fill_in "Address", with: @referrer.address
    fill_in "Email", with: @referrer.email
    fill_in "Lab branch", with: @referrer.lab_branch_id
    fill_in "Name", with: @referrer.name
    fill_in "Phone", with: @referrer.phone
    fill_in "Share code", with: @referrer.share_code
    click_on "Create Referrer"

    assert_text "Referrer was successfully created"
    click_on "Back"
  end

  test "should update Referrer" do
    visit referrer_url(@referrer)
    click_on "Edit this referrer", match: :first

    fill_in "Address", with: @referrer.address
    fill_in "Email", with: @referrer.email
    fill_in "Lab branch", with: @referrer.lab_branch_id
    fill_in "Name", with: @referrer.name
    fill_in "Phone", with: @referrer.phone
    fill_in "Share code", with: @referrer.share_code
    click_on "Update Referrer"

    assert_text "Referrer was successfully updated"
    click_on "Back"
  end

  test "should destroy Referrer" do
    visit referrer_url(@referrer)
    click_on "Destroy this referrer", match: :first

    assert_text "Referrer was successfully destroyed"
  end
end
