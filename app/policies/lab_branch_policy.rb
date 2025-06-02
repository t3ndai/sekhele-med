class LabBranchPolicy < ApplicationPolicy
  def show?
    user.admin? || user.lab_branch_user&.lab_branch == record
  end
end
# This policy allows users to view a lab branch if they are an admin or if they are a user associated with that specific lab branch.
#
