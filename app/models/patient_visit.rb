class PatientVisit < ApplicationRecord
  belongs_to :patient
  belongs_to :referrer, optional: true
  has_one_attached :request_pad
  has_many_attached :docs
  has_many :patient_procedures, dependent: :destroy
  has_many :procedures, through: :patient_procedures
  has_many :patient_procedure_results, through: :patient_procedures
  has_one :patient_visit_billing, dependent: :destroy

  enum :visit_type, { referral: "referral", walk_in: "walk_in" }, allow_nil: false
end
