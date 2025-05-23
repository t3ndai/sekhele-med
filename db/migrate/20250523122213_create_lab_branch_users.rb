class CreateLabBranchUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :lab_branch_users do |t|
      t.belongs_to :lab_branch, null: false, foreign_key: true
      t.string :first_name
      t.string :middle_names
      t.string :last_names
      t.string :role_type
      t.string :phone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
