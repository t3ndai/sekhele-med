class LabBranch < ApplicationRecord
  belongs_to :lab

  validates :name, presence: true, uniqueness: { scope: :lab_id }
end
