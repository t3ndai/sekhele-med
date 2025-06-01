class LabBranch < ApplicationRecord
  belongs_to :lab
  has_many :referrers, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :patient_visits, through: :patients
  has_many :patient_visit_billings, through: :patient_visits
  has_many :lab_branch_users, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :lab_id }

  scope :today_visits, -> { joins(:patient_visits).where(patient_visits: { created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day }).count }

  scope :today_receipts, -> { joins(:patient_visits)
    .where(patient_visits: { created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day })
    .joins(:patient_visit_billings)
    .sum("patient_visit_billings.amount_paid") }

  def today_receipts
    self.class.today_receipts
  end

  def today_visits
    self.class.today_visits
  end
end
