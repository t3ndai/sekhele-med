# == Schema Information
#
# Table name: patient_procedures
#
#  id                 :integer          not null, primary key
#  procedure_at       :time
#  procedure_on       :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lab_branch_user_id :integer          not null
#  patient_visit_id   :integer          not null
#  procedure_id       :integer          not null
#
# Indexes
#
#  index_patient_procedures_on_lab_branch_user_id  (lab_branch_user_id)
#  index_patient_procedures_on_patient_visit_id    (patient_visit_id)
#  index_patient_procedures_on_procedure_id        (procedure_id)
#
# Foreign Keys
#
#  lab_branch_user_id  (lab_branch_user_id => lab_branch_users.id)
#  patient_visit_id    (patient_visit_id => patient_visits.id)
#  procedure_id        (procedure_id => procedures.id)
#
require "test_helper"

class PatientProcedureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
