# == Schema Information
#
# Table name: referrers
#
#  id            :integer          not null, primary key
#  address       :text
#  email         :string
#  name          :string
#  phone         :string
#  share_code    :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lab_branch_id :integer          not null
#
# Indexes
#
#  index_referrers_on_lab_branch_id  (lab_branch_id)
#
# Foreign Keys
#
#  lab_branch_id  (lab_branch_id => lab_branches.id)
#
require "test_helper"

class ReferrerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
