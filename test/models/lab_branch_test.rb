# == Schema Information
#
# Table name: lab_branches
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lab_id     :integer          not null
#
# Indexes
#
#  index_lab_branches_on_lab_id  (lab_id)
#
# Foreign Keys
#
#  lab_id  (lab_id => labs.id)
#
require "test_helper"

class LabBranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
