class Procedure < ApplicationRecord
  belongs_to :lab_branch
  validates :name, :code, :cost, presence: true
  validates :name, uniqueness: { scope: :lab_branch_id }
  validates :code, uniqueness: { scope: :lab_branch_id }
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
end
