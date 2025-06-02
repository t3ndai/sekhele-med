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
class Referrer < ApplicationRecord
  belongs_to :lab_branch

  has_many :patient_visits, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :lab_branch_id }
  validates :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def all_time_referrals
     patient_visits.count
  end


  def this_month_referrals
    patient_visits.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).count
  end
end
