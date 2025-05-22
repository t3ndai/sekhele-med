class CreateLabs < ActiveRecord::Migration[8.0]
  def change
    create_table :labs do |t|
      t.string :company_name
      t.string :trading_name

      t.timestamps
    end
  end
end
