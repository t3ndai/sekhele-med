# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string           not null
#  password_digest    :string           not null
#  role               :string           default("user"), not null
#  verified           :boolean          default(FALSE), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lab_branch_user_id :integer
#  lab_user_id        :integer
#
# Indexes
#
#  index_users_on_email               (email) UNIQUE
#  index_users_on_lab_branch_user_id  (lab_branch_user_id)
#  index_users_on_lab_user_id         (lab_user_id)
#
# Foreign Keys
#
#  lab_branch_user_id  (lab_branch_user_id => lab_branch_users.id)
#  lab_user_id         (lab_user_id => lab_users.id)
#
class User < ApplicationRecord
  has_secure_password

  enum :role, { app_admin: "app_admin", user: "user", admin: "admin" }, default: :user

  generates_token_for :email_verification, expires_in: 2.days do
    email
  end

  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt.last(10)
  end

  belongs_to :lab_user, optional: true
  belongs_to :lab_branch_user, optional: true
  has_one :lab_branch, through: :lab_branch_user

  has_many :sessions, dependent: :destroy
  has_many :sign_in_tokens, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 12 }
  validates :password, not_pwned: { message: "might easily be guessed" }

  normalizes :email, with: -> { _1.strip.downcase }

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_create do
    self.role = :app_admin if self.email == "prince@sekhele.com"
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  after_update if: :email_previously_changed? do
    events.create! action: "email_verification_requested"
  end

  after_update if: :password_digest_previously_changed? do
    events.create! action: "password_changed"
  end

  after_update if: [ :verified_previously_changed?, :verified? ] do
    events.create! action: "email_verified"
  end
end
