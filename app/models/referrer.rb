class Referrer < ApplicationRecord
  belongs_to :lab_branch

  validates :name, presence: true, uniqueness: { scope: :lab_branch_id }
  validates :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
