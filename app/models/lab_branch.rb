# == Schema Information
#
# Table name: lab_branches
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lab_id     :integer          not null
#
# Indexes
#
#  index_lab_branches_on_lab_id  (lab_id)
#
# Foreign Keys
#
#  lab_id  (lab_id => labs.id)
#
class LabBranch < ApplicationRecord
  belongs_to :lab
  has_many :referrers, dependent: :destroy
  has_many :procedures, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :patient_visits, through: :patients
  has_many :patient_procedures, through: :patient_visits
  has_many :patient_visit_billings, through: :patient_visits
  has_many :lab_branch_users, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :lab_id }

  def today_visits
    patient_visits.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
  end

  def today_receipts
    patient_visits.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    .joins(:patient_visit_billing)
    .sum("patient_visit_billing.amount_paid")
  end

  def procedures_stats
    today_range = Time.zone.now.beginning_of_day..Time.zone.now.end_of_day

    # Get today's patient visits with necessary associations
    todays_visits = patient_visits.includes(
      :patient_procedures,
      :patient_visit_billing,
      patient_procedures: :procedure
    ).where(created_at: today_range)

    procedure_stats = {}

    todays_visits.each do |patient_visit|
      # Get the billing for this visit (since each visit has one billing record)
      billing = patient_visit.patient_visit_billing

      # Calculate per-procedure billing amounts if there are multiple procedures
      procedure_count = patient_visit.patient_procedures.count
      per_procedure_billed = procedure_count > 0 ? (billing&.amount_due || 0) / procedure_count.to_f : 0
      per_procedure_paid = procedure_count > 0 ? (billing&.amount_paid || 0) / procedure_count.to_f : 0

      patient_visit.patient_procedures.each do |patient_procedure|
        procedure = patient_procedure.procedure
        procedure_id = procedure.id

        # Initialize procedure stats if not exists
        procedure_stats[procedure_id] ||= {
          id: procedure_id,
          name: procedure.name,
          count: 0,
          billed_amount: 0,
          paid_amount: 0,
          payment_methods: Hash.new(0)
        }

        # Increment count for today's procedures
        if patient_procedure.created_at >= today_range.begin && patient_procedure.created_at <= today_range.end
          procedure_stats[procedure_id][:count] += 1
        end

        # Add proportional billing amounts for today's visits
        if billing.present?
          procedure_stats[procedure_id][:billed_amount] += per_procedure_billed
          procedure_stats[procedure_id][:paid_amount] += per_procedure_paid

          if billing.payment_method.present?
            procedure_stats[procedure_id][:payment_methods][billing.payment_method] += 1
          end
        end
      end
    end

    procedure_stats.values
  end

  def as_json(options = {})
    super(options).merge(
      today_visits: today_visits,
      today_receipts: today_receipts,
      procedures_stats: procedures_stats
    )
  end
end
