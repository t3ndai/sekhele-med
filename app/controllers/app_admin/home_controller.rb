class AppAdmin::HomeController < ApplicationController
  def index
    render inertia: "AppAdmin/Index"
  end
end
