class Lab < ApplicationRecord
  has_many  :lab_branches, dependent: :destroy
  has_many :lab_users, dependent: :destroy
  has_many :users, through: :lab_users

  validates :company_name, :trading_name, presence: true, uniqueness: true, length: { maximum: 255 }
end
