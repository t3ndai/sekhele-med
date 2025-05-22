class CreateLabUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :lab_users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.belongs_to :lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
