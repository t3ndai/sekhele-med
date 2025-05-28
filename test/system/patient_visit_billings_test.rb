require "application_system_test_case"

class PatientVisitBillingsTest < ApplicationSystemTestCase
  setup do
    @patient_visit_billing = patient_visit_billings(:one)
  end

  test "visiting the index" do
    visit patient_visit_billings_url
    assert_selector "h1", text: "Patient visit billings"
  end

  test "should create patient visit billing" do
    visit patient_visit_billings_url
    click_on "New patient visit billing"

    fill_in "Amount due", with: @patient_visit_billing.amount_due
    fill_in "Amount paid", with: @patient_visit_billing.amount_paid
    fill_in "Patient visit", with: @patient_visit_billing.patient_visit_id
    fill_in "Payment method", with: @patient_visit_billing.payment_method
    fill_in "Status", with: @patient_visit_billing.status
    click_on "Create Patient visit billing"

    assert_text "Patient visit billing was successfully created"
    click_on "Back"
  end

  test "should update Patient visit billing" do
    visit patient_visit_billing_url(@patient_visit_billing)
    click_on "Edit this patient visit billing", match: :first

    fill_in "Amount due", with: @patient_visit_billing.amount_due
    fill_in "Amount paid", with: @patient_visit_billing.amount_paid
    fill_in "Patient visit", with: @patient_visit_billing.patient_visit_id
    fill_in "Payment method", with: @patient_visit_billing.payment_method
    fill_in "Status", with: @patient_visit_billing.status
    click_on "Update Patient visit billing"

    assert_text "Patient visit billing was successfully updated"
    click_on "Back"
  end

  test "should destroy Patient visit billing" do
    visit patient_visit_billing_url(@patient_visit_billing)
    click_on "Destroy this patient visit billing", match: :first

    assert_text "Patient visit billing was successfully destroyed"
  end
end
