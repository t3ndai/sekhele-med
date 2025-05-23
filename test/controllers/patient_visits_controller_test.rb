require "test_helper"

class PatientVisitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_visit = patient_visits(:one)
  end

  test "should get index" do
    get patient_visits_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_visit_url
    assert_response :success
  end

  test "should create patient_visit" do
    assert_difference("PatientVisit.count") do
      post patient_visits_url, params: { patient_visit: { allergies: @patient_visit.allergies, medicines: @patient_visit.medicines, patient_id: @patient_visit.patient_id, referrer_id: @patient_visit.referrer_id, visit_time: @patient_visit.visit_time, visit_type: @patient_visit.visit_type, vitals: @patient_visit.vitals } }
    end

    assert_redirected_to patient_visit_url(PatientVisit.last)
  end

  test "should show patient_visit" do
    get patient_visit_url(@patient_visit)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_visit_url(@patient_visit)
    assert_response :success
  end

  test "should update patient_visit" do
    patch patient_visit_url(@patient_visit), params: { patient_visit: { allergies: @patient_visit.allergies, medicines: @patient_visit.medicines, patient_id: @patient_visit.patient_id, referrer_id: @patient_visit.referrer_id, visit_time: @patient_visit.visit_time, visit_type: @patient_visit.visit_type, vitals: @patient_visit.vitals } }
    assert_redirected_to patient_visit_url(@patient_visit)
  end

  test "should destroy patient_visit" do
    assert_difference("PatientVisit.count", -1) do
      delete patient_visit_url(@patient_visit)
    end

    assert_redirected_to patient_visits_url
  end
end
