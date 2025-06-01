class LabAdmin::HomeController < ApplicationController
  def index
    branches = Current.user.lab_user.lab.lab_branches.map do |branch|
      {
        id: branch.id,
        name: branch.name,
        visits: branch.today_visits,
        receipts: branch.today_receipts
      }
    end
    render inertia: "LabAdmin/Home/Index", props: {
      lab_id: Current.user.lab_user.lab.id,
      branches: branches
    }
  end
end
