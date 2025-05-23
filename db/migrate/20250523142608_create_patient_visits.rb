class CreatePatientVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :patient_visits do |t|
      t.belongs_to :patient, null: false, foreign_key: true
      t.belongs_to :referrer, null: true, foreign_key: true
      t.string :visit_type
      t.json :allergies
      t.json :medicines
      t.json :vitals
      t.time :visit_time

      t.timestamps
    end
  end
end
