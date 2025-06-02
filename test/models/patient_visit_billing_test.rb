# == Schema Information
#
# Table name: patient_visit_billings
#
#  id               :integer          not null, primary key
#  amount_due       :decimal(, )
#  amount_paid      :decimal(, )
#  payment_method   :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  patient_visit_id :integer          not null
#
# Indexes
#
#  index_patient_visit_billings_on_patient_visit_id  (patient_visit_id)
#
# Foreign Keys
#
#  patient_visit_id  (patient_visit_id => patient_visits.id)
#
require "test_helper"

class PatientVisitBillingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
