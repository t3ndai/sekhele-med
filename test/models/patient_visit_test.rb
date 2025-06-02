# == Schema Information
#
# Table name: patient_visits
#
#  id          :integer          not null, primary key
#  allergies   :json
#  medicines   :json
#  visit_time  :time
#  visit_type  :string
#  vitals      :json
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  patient_id  :integer          not null
#  referrer_id :integer
#
# Indexes
#
#  index_patient_visits_on_patient_id   (patient_id)
#  index_patient_visits_on_referrer_id  (referrer_id)
#
# Foreign Keys
#
#  patient_id   (patient_id => patients.id)
#  referrer_id  (referrer_id => referrers.id)
#
require "test_helper"

class PatientVisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
