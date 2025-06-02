# == Schema Information
#
# Table name: patient_visits
#
#  id          :integer          not null, primary key
#  allergies   :json
#  medicines   :json
#  visit_time  :time
#  visit_type  :string
#  vitals      :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :integer          not null
#  referrer_id :integer
#
# Indexes
#
#  index_patient_visits_on_patient_id   (patient_id)
#  index_patient_visits_on_referrer_id  (referrer_id)
#
# Foreign Keys
#
#  patient_id   (patient_id => patients.id)
#  referrer_id  (referrer_id => referrers.id)
#
class PatientVisit < ApplicationRecord
  belongs_to :patient
  belongs_to :referrer, optional: true
  has_one_attached :request_pad
  has_many_attached :docs
  has_many :patient_procedures, dependent: :destroy
  has_many :procedures, through: :patient_procedures
  has_many :patient_procedure_results, through: :patient_procedures
  has_one :patient_visit_billing, dependent: :destroy

  validates :referrer, presence: true

  enum :visit_type, { referral: "referral", walk_in: "walk_in" }, allow_nil: false

  def as_json(options = {})
    super(options).merge(
      visit_time: visit_time.strftime("%H:%M"),
      visit_on: created_at.strftime("%d-%m-%Y"),
    )
  end
end
