# == Schema Information
#
# Table name: lab_users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lab_id     :integer          not null
#
# Indexes
#
#  index_lab_users_on_lab_id  (lab_id)
#
# Foreign Keys
#
#  lab_id  (lab_id => labs.id)
#
require "test_helper"

class LabUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
