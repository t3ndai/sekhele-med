require "application_system_test_case"

class PatientVisitsTest < ApplicationSystemTestCase
  setup do
    @patient_visit = patient_visits(:one)
  end

  test "visiting the index" do
    visit patient_visits_url
    assert_selector "h1", text: "Patient visits"
  end

  test "should create patient visit" do
    visit patient_visits_url
    click_on "New patient visit"

    fill_in "Allergies", with: @patient_visit.allergies
    fill_in "Medicines", with: @patient_visit.medicines
    fill_in "Patient", with: @patient_visit.patient_id
    fill_in "Referrer", with: @patient_visit.referrer_id
    fill_in "Visit time", with: @patient_visit.visit_time
    fill_in "Visit type", with: @patient_visit.visit_type
    fill_in "Vitals", with: @patient_visit.vitals
    click_on "Create Patient visit"

    assert_text "Patient visit was successfully created"
    click_on "Back"
  end

  test "should update Patient visit" do
    visit patient_visit_url(@patient_visit)
    click_on "Edit this patient visit", match: :first

    fill_in "Allergies", with: @patient_visit.allergies
    fill_in "Medicines", with: @patient_visit.medicines
    fill_in "Patient", with: @patient_visit.patient_id
    fill_in "Referrer", with: @patient_visit.referrer_id
    fill_in "Visit time", with: @patient_visit.visit_time.to_s
    fill_in "Visit type", with: @patient_visit.visit_type
    fill_in "Vitals", with: @patient_visit.vitals
    click_on "Update Patient visit"

    assert_text "Patient visit was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient visit" do
    visit patient_visit_url(@patient_visit)
    click_on "Destroy this patient visit", match: :first

    assert_text "Patient visit was successfully destroyed"
  end
end
