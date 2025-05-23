class PatientProceduresController < ApplicationController
  before_action :set_patient_procedure, only: %i[ show edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /patient_procedures
  def index
    @patient_procedures = PatientProcedure.all
    render inertia: 'PatientProcedure/Index', props: {
      patient_procedures: @patient_procedures.map do |patient_procedure|
        serialize_patient_procedure(patient_procedure)
      end
    }
  end

  # GET /patient_procedures/1
  def show
    render inertia: 'PatientProcedure/Show', props: {
      patient_procedure: serialize_patient_procedure(@patient_procedure)
    }
  end

  # GET /patient_procedures/new
  def new
    @patient_procedure = PatientProcedure.new
    render inertia: 'PatientProcedure/New', props: {
      patient_procedure: serialize_patient_procedure(@patient_procedure)
    }
  end

  # GET /patient_procedures/1/edit
  def edit
    render inertia: 'PatientProcedure/Edit', props: {
      patient_procedure: serialize_patient_procedure(@patient_procedure)
    }
  end

  # POST /patient_procedures
  def create
    @patient_procedure = PatientProcedure.new(patient_procedure_params)

    if @patient_procedure.save
      redirect_to @patient_procedure, notice: "Patient procedure was successfully created."
    else
      redirect_to new_patient_procedure_url, inertia: { errors: @patient_procedure.errors }
    end
  end

  # PATCH/PUT /patient_procedures/1
  def update
    if @patient_procedure.update(patient_procedure_params)
      redirect_to @patient_procedure, notice: "Patient procedure was successfully updated."
    else
      redirect_to edit_patient_procedure_url(@patient_procedure), inertia: { errors: @patient_procedure.errors }
    end
  end

  # DELETE /patient_procedures/1
  def destroy
    @patient_procedure.destroy!
    redirect_to patient_procedures_url, notice: "Patient procedure was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_procedure
      @patient_procedure = PatientProcedure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_procedure_params
      params.require(:patient_procedure).permit(:procedure_id, :lab_branch_user_id, :procedure_on, :procedure_at, :patient_visit_id)
    end

    def serialize_patient_procedure(patient_procedure)
      patient_procedure.as_json(only: [
        :id, :procedure_id, :lab_branch_user_id, :procedure_on, :procedure_at, :patient_visit_id
      ])
    end
end
