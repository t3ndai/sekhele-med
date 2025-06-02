# == Schema Information
#
# Table name: lab_branch_users
#
#  id            :integer          not null, primary key
#  address       :text
#  email         :string
#  first_name    :string
#  last_names    :string
#  middle_names  :string
#  phone         :string
#  role_type     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lab_branch_id :integer          not null
#
# Indexes
#
#  index_lab_branch_users_on_lab_branch_id  (lab_branch_id)
#
# Foreign Keys
#
#  lab_branch_id  (lab_branch_id => lab_branches.id)
#
require "test_helper"

class LabBranchUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
