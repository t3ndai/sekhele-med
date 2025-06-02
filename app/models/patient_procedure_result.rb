# == Schema Information
#
# Table name: patient_procedure_results
#
#  id                   :integer          not null, primary key
#  notes                :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  lab_branch_user_id   :integer          not null
#  patient_procedure_id :integer          not null
#
# Indexes
#
#  index_patient_procedure_results_on_lab_branch_user_id    (lab_branch_user_id)
#  index_patient_procedure_results_on_patient_procedure_id  (patient_procedure_id)
#
# Foreign Keys
#
#  lab_branch_user_id    (lab_branch_user_id => lab_branch_users.id)
#  patient_procedure_id  (patient_procedure_id => patient_procedures.id)
#
class PatientProcedureResult < ApplicationRecord
  belongs_to :lab_branch_user
  belongs_to :patient_procedure
  has_many_attached :images

  validates :images, presence: true
end
