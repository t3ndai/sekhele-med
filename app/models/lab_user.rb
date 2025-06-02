# == Schema Information
#
# Table name: lab_users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lab_id     :integer          not null
#
# Indexes
#
#  index_lab_users_on_lab_id  (lab_id)
#
# Foreign Keys
#
#  lab_id  (lab_id => labs.id)
#
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
