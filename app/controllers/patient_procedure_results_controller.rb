class PatientProcedureResultsController < ApplicationController
  before_action :set_patient_procedure_result, only: %i[ show edit update destroy ]
  before_action :set_patient_procedure, only: %i[ index new create ]

  inertia_share flash: -> { flash.to_hash }

  # GET /patient_procedure_results
  def index
    @patient_procedure_results = PatientProcedureResult.all
    render inertia: "PatientProcedureResult/Index", props: {
      patient_procedure_results: @patient_procedure_results.map do |patient_procedure_result|
        serialize_patient_procedure_result(patient_procedure_result)
      end
    }
  end

  # GET /patient_procedure_results/1
  def show
    render inertia: "PatientProcedureResult/Show", props: {
      patient_procedure_result: serialize_patient_procedure_result(@patient_procedure_result)
    }
  end

  # GET /patient_procedure_results/new
  def new
    @patient_procedure_result = PatientProcedureResult.new
    assignees = @patient_procedure.lab_branch_user.lab_branch.lab_branch_users.medical_staff.map do |lab_branch_user|
      {
        id: lab_branch_user.id,
        name: lab_branch_user.name
      }
    end
    render inertia: "PatientProcedureResult/New", props: {
      patient_procedure_result: serialize_patient_procedure_result(@patient_procedure_result),
      assignees:,
      patient_procedure_id: @patient_procedure.id,
      patient_procedure_url: patient_procedure_url(@patient_procedure)
    }
  end

  # GET /patient_procedure_results/1/edit
  def edit
    render inertia: "PatientProcedureResult/Edit", props: {
      patient_procedure_result: serialize_patient_procedure_result(@patient_procedure_result)
    }
  end

  # POST /patient_procedure_results
  def create
    @patient_procedure_result = PatientProcedureResult.new(patient_procedure_result_params)

    images = params[:patient_procedure_result][:images].values
    images.each do |image|
      @patient_procedure_result.images.attach(image)
    end

    @patient_procedure_result.patient_procedure = @patient_procedure

    if @patient_procedure_result.save
      redirect_to @patient_procedure_result, notice: "Patient procedure result was successfully created."
    else
      redirect_to new_patient_procedure_patient_procedure_result_url(@patient_procedure), inertia: { errors: @patient_procedure_result.errors }
    end
  end

  # PATCH/PUT /patient_procedure_results/1
  def update
    if @patient_procedure_result.update(patient_procedure_result_params)
      redirect_to @patient_procedure_result, notice: "Patient procedure result was successfully updated."
    else
      redirect_to edit_patient_procedure_result_url(@patient_procedure_result), inertia: { errors: @patient_procedure_result.errors }
    end
  end

  # DELETE /patient_procedure_results/1
  def destroy
    @patient_procedure = @patient_procedure_result.patient_procedure
    @patient_procedure_result.destroy!
    redirect_to patient_procedure_patient_procedure_results_url(@patient_procedure), notice: "Patient procedure result was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_procedure_result
      @patient_procedure_result = PatientProcedureResult.find(params[:id])
    end

    def set_patient_procedure
      @patient_procedure = PatientProcedure.find(params[:patient_procedure_id])
    end

    # Only allow a list of trusted parameters through.
    def patient_procedure_result_params
      params.expect(patient_procedure_result: [ :notes, :lab_branch_user_id, :patient_procedure_id, images: [] ])
    end

    def serialize_patient_procedure_result(patient_procedure_result)
      patient_procedure_result.as_json(only: [
        :id, :notes, :lab_branch_user_id, :patient_procedure_id
      ]).tap do |hash|
        hash["images"] =
          patient_procedure_result.images.flat_map do |file|
            { filename: file.filename.to_s, url: url_for(file) }
          end
      end
    end
end
