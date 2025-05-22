class Patient < ApplicationRecord
  belongs_to :lab_branch

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true, comparison: { less_than: Date.today }
  validates :address, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :emergency_contact, presence: true
end
