# == Schema Information
#
# Table name: procedures
#
#  id            :integer          not null, primary key
#  code          :string
#  cost          :decimal(, )
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lab_branch_id :integer          not null
#
# Indexes
#
#  index_procedures_on_lab_branch_id  (lab_branch_id)
#
# Foreign Keys
#
#  lab_branch_id  (lab_branch_id => lab_branches.id)
#
class Procedure < ApplicationRecord
  belongs_to :lab_branch
  validates :name, :code, :cost, presence: true
  validates :name, uniqueness: { scope: :lab_branch_id }
  validates :code, uniqueness: { scope: :lab_branch_id }
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
end
