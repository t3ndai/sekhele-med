class PatientProcedure < ApplicationRecord
  belongs_to :procedure
  belongs_to :lab_branch_user
  belongs_to :patient_visit
end
