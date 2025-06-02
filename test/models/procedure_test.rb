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
require "test_helper"

class ProcedureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
