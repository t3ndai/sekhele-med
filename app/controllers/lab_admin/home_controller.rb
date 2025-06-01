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
    referrers = Current.user.lab_user.lab.referrers.map do |referrer|
      {
        id: referrer.id,
        name: referrer.name,
        all_time: referrer.all_time_referrals,
        this_month: referrer.this_month_referrals
      }
    end
    render inertia: "LabAdmin/Home/Index", props: {
      lab_id: Current.user.lab_user.lab.id,
      branches: branches,
      referrers: referrers
    }
  end
end
