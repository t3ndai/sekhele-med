class PatientProcedureResult < ApplicationRecord
  belongs_to :lab_branch_user
  belongs_to :patient_procedure
  has_many_attached :images

  validates :images, presence: true
end
