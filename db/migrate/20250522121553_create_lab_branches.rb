class CreateLabBranches < ActiveRecord::Migration[8.0]
  def change
    create_table :lab_branches do |t|
      t.string :name
      t.belongs_to :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
