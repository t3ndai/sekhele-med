require "application_system_test_case"

class PatientProcedureResultsTest < ApplicationSystemTestCase
  setup do
    @patient_procedure_result = patient_procedure_results(:one)
  end

  test "visiting the index" do
    visit patient_procedure_results_url
    assert_selector "h1", text: "Patient procedure results"
  end

  test "should create patient procedure result" do
    visit patient_procedure_results_url
    click_on "New patient procedure result"

    fill_in "Lab branch user", with: @patient_procedure_result.lab_branch_user_id
    fill_in "Notes", with: @patient_procedure_result.notes
    fill_in "Patient procedure", with: @patient_procedure_result.patient_procedure_id
    click_on "Create Patient procedure result"

    assert_text "Patient procedure result was successfully created"
    click_on "Back"
  end

  test "should update Patient procedure result" do
    visit patient_procedure_result_url(@patient_procedure_result)
    click_on "Edit this patient procedure result", match: :first

    fill_in "Lab branch user", with: @patient_procedure_result.lab_branch_user_id
    fill_in "Notes", with: @patient_procedure_result.notes
    fill_in "Patient procedure", with: @patient_procedure_result.patient_procedure_id
    click_on "Update Patient procedure result"

    assert_text "Patient procedure result was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient procedure result" do
    visit patient_procedure_result_url(@patient_procedure_result)
    click_on "Destroy this patient procedure result", match: :first

    assert_text "Patient procedure result was successfully destroyed"
  end
end
