# == Schema Information
#
# Table name: patients
#
#  id                :integer          not null, primary key
#  address           :text
#  dob               :date
#  email             :string
#  emergency_contact :json
#  first_name        :string
#  last_name         :string
#  middle_names      :string
#  phone             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  lab_branch_id     :integer          not null
#
# Indexes
#
#  index_patients_on_lab_branch_id  (lab_branch_id)
#
# Foreign Keys
#
#  lab_branch_id  (lab_branch_id => lab_branches.id)
#
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

  def full_name
    "#{first_name} #{middle_names} #{last_name}"
  end

  def as_json(options = {})
    super(options).merge(
      full_name: full_name,
      dob: dob.strftime("%d-%m-%Y"),
      patient_visits: patient_visits.map do |visit|
        {
          id: visit.id,
          visit_time: visit.visit_time.strftime("%H:%M"),
          visit_on: visit.created_at.strftime("%d-%m-%Y"),
          visit_type: visit.visit_type,
          is_billed: visit.is_billed?,
          referrer: visit.referrer&.name
        }
      end
    )
  end
end
