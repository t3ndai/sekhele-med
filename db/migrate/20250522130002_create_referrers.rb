class CreateReferrers < ActiveRecord::Migration[8.0]
  def change
    create_table :referrers do |t|
      t.belongs_to :lab_branch, null: false, foreign_key: true
      t.string :share_code
      t.string :name
      t.text :address
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
