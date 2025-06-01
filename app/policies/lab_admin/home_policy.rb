class LabAdmin::HomePolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
