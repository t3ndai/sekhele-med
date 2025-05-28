class CreatePatientVisitBillings < ActiveRecord::Migration[8.0]
  def change
    create_table :patient_visit_billings do |t|
      t.decimal :amount_due
      t.decimal :amount_paid
      t.string :status
      t.string :payment_method
      t.belongs_to :patient_visit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
