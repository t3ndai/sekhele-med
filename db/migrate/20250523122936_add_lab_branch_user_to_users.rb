class AddLabBranchUserToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :lab_branch_user, null: true, foreign_key: true
  end
end
