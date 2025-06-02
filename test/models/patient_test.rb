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
require "test_helper"

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
