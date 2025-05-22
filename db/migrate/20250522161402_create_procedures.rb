class CreateProcedures < ActiveRecord::Migration[8.0]
  def change
    create_table :procedures do |t|
      t.string :name
      t.string :code
      t.decimal :cost
      t.belongs_to :lab_branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
