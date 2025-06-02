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
class PatientVisitBilling < ApplicationRecord
  belongs_to :patient_visit
  has_many_attached :proof

  enum :status, { pending: "pending", paid: "paid", cancelled: "cancelled" }, allow_nil: false
  enum :payment_method, { cash: "cash", card: "card", online: "online", medical_aid: "medical_aid" }, allow_nil: false
  validates :amount_due, :amount_paid, :status, :payment_method, presence: true
  validates :amount_due, numericality: { greater_than_or_equal_to: 0 }
  validates :amount_paid, numericality: { greater_than_or_equal_to: 0 }
  validate :amount_paid_cannot_exceed_amount_due
  validates :proof, content_type: { in: [ "image/png", "image/jpeg", "application/pdf" ], message: "must be a PNG, JPG, JPEG, or PDF file" }, size: { less_than: 5.megabytes, message: "must be less than 5MB" }
  validates :proof, presence: true, if: -> { status == "paid" || status == "medical_aid" }

  def amount_paid_cannot_exceed_amount_due
    if amount_paid.present? && amount_due.present? && amount_paid > amount_due
      errors.add(:amount_paid, "cannot exceed the amount due")
    end
  end
end
