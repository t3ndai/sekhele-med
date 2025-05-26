require "test_helper"

class PatientProcedureResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_procedure_result = patient_procedure_results(:one)
  end

  test "should get index" do
    get patient_procedure_results_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_procedure_result_url
    assert_response :success
  end

  test "should create patient_procedure_result" do
    assert_difference("PatientProcedureResult.count") do
      post patient_procedure_results_url, params: { patient_procedure_result: { lab_branch_user_id: @patient_procedure_result.lab_branch_user_id, notes: @patient_procedure_result.notes, patient_procedure_id: @patient_procedure_result.patient_procedure_id } }
    end

    assert_redirected_to patient_procedure_result_url(PatientProcedureResult.last)
  end

  test "should show patient_procedure_result" do
    get patient_procedure_result_url(@patient_procedure_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_procedure_result_url(@patient_procedure_result)
    assert_response :success
  end

  test "should update patient_procedure_result" do
    patch patient_procedure_result_url(@patient_procedure_result), params: { patient_procedure_result: { lab_branch_user_id: @patient_procedure_result.lab_branch_user_id, notes: @patient_procedure_result.notes, patient_procedure_id: @patient_procedure_result.patient_procedure_id } }
    assert_redirected_to patient_procedure_result_url(@patient_procedure_result)
  end

  test "should destroy patient_procedure_result" do
    assert_difference("PatientProcedureResult.count", -1) do
      delete patient_procedure_result_url(@patient_procedure_result)
    end

    assert_redirected_to patient_procedure_results_url
  end
end
