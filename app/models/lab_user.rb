class LabUser < ApplicationRecord
  belongs_to :lab
  has_one :user, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, :username, presence: true
  validates :name, :username, length: { minimum: 2 }, uniqueness: { scope: :lab_id }

  after_create ->(lab_user) { lab_user.create_user(email: email, password: SecureRandom.base58, verified: true, role: :admin) }

  def org_name
    lab.trading_name
  end
end
