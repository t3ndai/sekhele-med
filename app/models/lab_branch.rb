class LabBranch < ApplicationRecord
  belongs_to :lab
  has_many :referrers, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :lab_users, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :patient_visits, through: :patients
  has_many :lab_branch_users, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :lab_id }
end
