# == Schema Information
#
# Table name: labs
#
#  id           :integer          not null, primary key
#  company_name :string
#  trading_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Lab < ApplicationRecord
  has_many  :lab_branches, dependent: :destroy
  has_many :lab_users, dependent: :destroy
  has_many :users, through: :lab_users
  has_many :referrers, through: :lab_branches

  validates :company_name, :trading_name, presence: true, uniqueness: true, length: { maximum: 255 }
end
