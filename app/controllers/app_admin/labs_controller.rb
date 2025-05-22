class AppAdmin::LabsController < ApplicationController
  before_action :set_lab, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /labs
  def index
    @labs = Lab.all
    render inertia: "Lab/Index", props: {
      labs: @labs.map do |lab|
        serialize_lab(lab)
      end
    }
  end

  # GET /labs/1
  def show
    render inertia: "Lab/Show", props: {
      lab: serialize_lab(@lab)
    }
  end

  # GET /labs/new
  def new
    @lab = Lab.new
    render inertia: "Lab/New", props: {
      lab: serialize_lab(@lab)
    }
  end

  # GET /labs/1/edit
  def edit
    render inertia: "Lab/Edit", props: {
      lab: serialize_lab(@lab)
    }
  end

  # POST /labs
  def create
    @lab = Lab.new(lab_params)

    if @lab.save
      redirect_to app_admin_lab_url(@lab), notice: "Lab was successfully created."
    else
      redirect_to new_app_admin_lab_url, inertia: { errors: @lab.errors }
    end
  end

  # PATCH/PUT /labs/1
  def update
    if @lab.update(lab_params)
      redirect_to app_admin_lab_url(@lab), notice: "Lab was successfully updated."
    else
      redirect_to edit_app_admin_lab_url(@lab), inertia: { errors: @lab.errors }
    end
  end

  # DELETE /labs/1
  def destroy
    @lab.destroy!
    redirect_to app_admin_labs_url, notice: "Lab was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab
      @lab = Lab.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lab_params
      params.require(:lab).permit(:company_name, :trading_name)
    end

    def serialize_lab(lab)
      lab.as_json(only: [
        :id, :company_name, :trading_name
      ])
    end
end
