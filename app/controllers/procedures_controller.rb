class ProceduresController < ApplicationController
  before_action :set_procedure, only: %i[ show edit update destroy ]
  before_action :set_lab_branch, only: %i[ new create  ]

  inertia_share flash: -> { flash.to_hash }

  # GET /procedures
  def index
    @procedures = Procedure.all
    render inertia: "Procedure/Index", props: {
      procedures: @procedures.map do |procedure|
        serialize_procedure(procedure)
      end
    }
  end

  # GET /procedures/1
  def show
    render inertia: "Procedure/Show", props: {
      procedure: serialize_procedure(@procedure)
    }
  end

  # GET /procedures/new
  def new
    @procedure = Procedure.new
    render inertia: "Procedure/New", props: {
      procedure: serialize_procedure(@procedure),
      lab_branch_id: @lab_branch.id
    }
  end

  # GET /procedures/1/edit
  def edit
    render inertia: "Procedure/Edit", props: {
      procedure: serialize_procedure(@procedure)
    }
  end

  # POST /procedures
  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.lab_branch = @lab_branch

    if @procedure.save
      redirect_to @procedure, notice: "Procedure was successfully created."
    else
      redirect_to new_procedure_url, inertia: { errors: @procedure.errors }
    end
  end

  # PATCH/PUT /procedures/1
  def update
    if @procedure.update(procedure_params)
      redirect_to @procedure, notice: "Procedure was successfully updated."
    else
      redirect_to edit_procedure_url(@procedure), inertia: { errors: @procedure.errors }
    end
  end

  # DELETE /procedures/1
  def destroy
    @procedure.destroy!
    redirect_to procedures_url, notice: "Procedure was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def set_lab_branch
      @lab_branch = LabBranch.find(params[:lab_branch_id])
    end

    # Only allow a list of trusted parameters through.
    def procedure_params
      params.require(:procedure).permit(:name, :code, :cost, :lab_branch_id)
    end

    def serialize_procedure(procedure)
      procedure.as_json(only: [
        :id, :name, :code, :cost, :lab_branch_id
      ])
    end
end
