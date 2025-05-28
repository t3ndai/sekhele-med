require "test_helper"

class PatientVisitBillingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_visit_billing = patient_visit_billings(:one)
  end

  test "should get index" do
    get patient_visit_billings_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_visit_billing_url
    assert_response :success
  end

  test "should create patient_visit_billing" do
    assert_difference("PatientVisitBilling.count") do
      post patient_visit_billings_url, params: { patient_visit_billing: { amount_due: @patient_visit_billing.amount_due, amount_paid: @patient_visit_billing.amount_paid, patient_visit_id: @patient_visit_billing.patient_visit_id, payment_method: @patient_visit_billing.payment_method, status: @patient_visit_billing.status } }
    end

    assert_redirected_to patient_visit_billing_url(PatientVisitBilling.last)
  end

  test "should show patient_visit_billing" do
    get patient_visit_billing_url(@patient_visit_billing)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_visit_billing_url(@patient_visit_billing)
    assert_response :success
  end

  test "should update patient_visit_billing" do
    patch patient_visit_billing_url(@patient_visit_billing), params: { patient_visit_billing: { amount_due: @patient_visit_billing.amount_due, amount_paid: @patient_visit_billing.amount_paid, patient_visit_id: @patient_visit_billing.patient_visit_id, payment_method: @patient_visit_billing.payment_method, status: @patient_visit_billing.status } }
    assert_redirected_to patient_visit_billing_url(@patient_visit_billing)
  end

  test "should destroy patient_visit_billing" do
    assert_difference("PatientVisitBilling.count", -1) do
      delete patient_visit_billing_url(@patient_visit_billing)
    end

    assert_redirected_to patient_visit_billings_url
  end
end
