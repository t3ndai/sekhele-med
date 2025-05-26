class CreatePatientProcedureResults < ActiveRecord::Migration[8.0]
  def change
    create_table :patient_procedure_results do |t|
      t.text :notes
      t.belongs_to :lab_branch_user, null: false, foreign_key: true
      t.belongs_to :patient_procedure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
