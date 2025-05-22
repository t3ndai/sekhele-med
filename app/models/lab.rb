class Lab < ApplicationRecord
  validates :company_name, :trading_name, presence: true, uniqueness: true, length: { maximum: 255 }
end
