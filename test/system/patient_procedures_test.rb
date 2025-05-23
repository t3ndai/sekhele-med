require "application_system_test_case"

class PatientProceduresTest < ApplicationSystemTestCase
  setup do
    @patient_procedure = patient_procedures(:one)
  end

  test "visiting the index" do
    visit patient_procedures_url
    assert_selector "h1", text: "Patient procedures"
  end

  test "should create patient procedure" do
    visit patient_procedures_url
    click_on "New patient procedure"

    fill_in "Lab branch user", with: @patient_procedure.lab_branch_user_id
    fill_in "Patient visit", with: @patient_procedure.patient_visit_id
    fill_in "Procedure at", with: @patient_procedure.procedure_at
    fill_in "Procedure", with: @patient_procedure.procedure_id
    fill_in "Procedure on", with: @patient_procedure.procedure_on
    click_on "Create Patient procedure"

    assert_text "Patient procedure was successfully created"
    click_on "Back"
  end

  test "should update Patient procedure" do
    visit patient_procedure_url(@patient_procedure)
    click_on "Edit this patient procedure", match: :first

    fill_in "Lab branch user", with: @patient_procedure.lab_branch_user_id
    fill_in "Patient visit", with: @patient_procedure.patient_visit_id
    fill_in "Procedure at", with: @patient_procedure.procedure_at.to_s
    fill_in "Procedure", with: @patient_procedure.procedure_id
    fill_in "Procedure on", with: @patient_procedure.procedure_on
    click_on "Update Patient procedure"

    assert_text "Patient procedure was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient procedure" do
    visit patient_procedure_url(@patient_procedure)
    click_on "Destroy this patient procedure", match: :first

    assert_text "Patient procedure was successfully destroyed"
  end
end
