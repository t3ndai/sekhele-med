class LabBranchUser < ApplicationRecord
  belongs_to :lab_branch
  has_many_attached :documents
  has_one :user, dependent: :destroy

  enum :role_type, { front_office: "front_office", medical: "medical" }, default: :front_office, allow_nil: false

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_names, :address, :phone, presence: true

  after_create ->(lab_branch_user) { lab_branch_user.create_user(email: email, password: SecureRandom.base58, verified: true, role: :user) }
end
