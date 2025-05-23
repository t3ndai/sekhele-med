class PatientVisit < ApplicationRecord
  belongs_to :patient
  belongs_to :referrer, optional: true
  has_one_attached :request_pad
  has_many_attached :docs

  enum :visit_type, { referral: "referral", walk_in: "walk_in" }, allow_nil: false
end
