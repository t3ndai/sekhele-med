class LabAdmin::HomeController < ApplicationController
  def index
    render inertia: "LabAdmin/Home/Index", props: {
      lab_id: Current.user.lab_user.lab.id
    }
  end
end
