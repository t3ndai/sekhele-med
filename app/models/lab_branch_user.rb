# == Schema Information
#
# Table name: lab_branch_users
#
#  id            :integer          not null, primary key
#  address       :text
#  email         :string
#  first_name    :string
#  last_names    :string
#  middle_names  :string
#  phone         :string
#  role_type     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lab_branch_id :integer          not null
#
# Indexes
#
#  index_lab_branch_users_on_lab_branch_id  (lab_branch_id)
#
# Foreign Keys
#
#  lab_branch_id  (lab_branch_id => lab_branches.id)
#
class LabBranchUser < ApplicationRecord
  attr_reader :name

  belongs_to :lab_branch
  has_many_attached :documents
  has_one :user, dependent: :destroy

  enum :role_type, { front_office: "front_office", medical: "medical" }, default: :front_office, allow_nil: false

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_names, :address, :phone, presence: true

  def name
    "#{first_name} #{middle_names} #{last_names}"
  end

  def role
    role_type.humanize
  end

  def org_name
    lab_branch&.lab&.trading_name
  end

  scope :medical_staff, -> { where(role_type: :medical) }

  after_create ->(lab_branch_user) { lab_branch_user.create_user(email: email, password: SecureRandom.base58, verified: true, role: :user) }

  def as_json(options = {})
    super(options.merge(methods: [ :name, :role, :org_name ]))
  end
end
