class CreatePatientProcedures < ActiveRecord::Migration[8.0]
  def change
    create_table :patient_procedures do |t|
      t.belongs_to :procedure, null: false, foreign_key: true
      t.belongs_to :lab_branch_user, null: false, foreign_key: true
      t.date :procedure_on
      t.time :procedure_at
      t.belongs_to :patient_visit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
