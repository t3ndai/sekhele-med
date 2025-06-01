class Patient < ApplicationRecord
  belongs_to :lab_branch

  has_many :patient_visits, dependent: :destroy
  has_many :patient_procedures, through: :patient_visits
  has_many :patient_procedure_results, through: :patient_procedures

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true, comparison: { less_than: Date.today }
  validates :address, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :emergency_contact, presence: true
end
