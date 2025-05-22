require "application_system_test_case"

class LabsTest < ApplicationSystemTestCase
  setup do
    @lab = labs(:one)
  end

  test "visiting the index" do
    visit labs_url
    assert_selector "h1", text: "Labs"
  end

  test "should create lab" do
    visit labs_url
    click_on "New lab"

    fill_in "Company name", with: @lab.company_name
    fill_in "Trading name", with: @lab.trading_name
    click_on "Create Lab"

    assert_text "Lab was successfully created"
    click_on "Back"
  end

  test "should update Lab" do
    visit lab_url(@lab)
    click_on "Edit this lab", match: :first

    fill_in "Company name", with: @lab.company_name
    fill_in "Trading name", with: @lab.trading_name
    click_on "Update Lab"

    assert_text "Lab was successfully updated"
    click_on "Back"
  end

  test "should destroy Lab" do
    visit lab_url(@lab)
    click_on "Destroy this lab", match: :first

    assert_text "Lab was successfully destroyed"
  end
end
