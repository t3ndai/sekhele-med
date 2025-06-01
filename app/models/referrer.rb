class Referrer < ApplicationRecord
  belongs_to :lab_branch

  has_many :patient_visits, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :lab_branch_id }
  validates :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :all_time_referrals, -> { joins(:patient_visits).count }
  scope :this_month_referrals, -> { joins(:patient_visits).where(patient_visits: { created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month }).count }

  def all_time_referrals
    self.class.all_time_referrals
  end

  def this_month_referrals
    self.class.this_month_referrals
  end
end
