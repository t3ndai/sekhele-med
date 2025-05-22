class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_names
      t.string :last_name
      t.date :dob
      t.text :address
      t.string :email
      t.string :phone
      t.belongs_to :lab_branch, null: false, foreign_key: true
      t.json :emergency_contact

      t.timestamps
    end
  end
end
