class LabBranchesController < ApplicationController
  before_action :set_lab_branch, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /lab_branches
  def index
    @lab_branches = LabBranch.all
    render inertia: 'LabBranch/Index', props: {
      lab_branches: @lab_branches.map do |lab_branch|
        serialize_lab_branch(lab_branch)
      end
    }
  end

  # GET /lab_branches/1
  def show
    render inertia: 'LabBranch/Show', props: {
      lab_branch: serialize_lab_branch(@lab_branch)
    }
  end

  # GET /lab_branches/new
  def new
    @lab_branch = LabBranch.new
    render inertia: 'LabBranch/New', props: {
      lab_branch: serialize_lab_branch(@lab_branch)
    }
  end

  # GET /lab_branches/1/edit
  def edit
    render inertia: 'LabBranch/Edit', props: {
      lab_branch: serialize_lab_branch(@lab_branch)
    }
  end

  # POST /lab_branches
  def create
    @lab_branch = LabBranch.new(lab_branch_params)

    if @lab_branch.save
      redirect_to @lab_branch, notice: "Lab branch was successfully created."
    else
      redirect_to new_lab_branch_url, inertia: { errors: @lab_branch.errors }
    end
  end

  # PATCH/PUT /lab_branches/1
  def update
    if @lab_branch.update(lab_branch_params)
      redirect_to @lab_branch, notice: "Lab branch was successfully updated."
    else
      redirect_to edit_lab_branch_url(@lab_branch), inertia: { errors: @lab_branch.errors }
    end
  end

  # DELETE /lab_branches/1
  def destroy
    @lab_branch.destroy!
    redirect_to lab_branches_url, notice: "Lab branch was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_branch
      @lab_branch = LabBranch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lab_branch_params
      params.require(:lab_branch).permit(:name, :lab_id)
    end

    def serialize_lab_branch(lab_branch)
      lab_branch.as_json(only: [
        :id, :name, :lab_id
      ])
    end
end
