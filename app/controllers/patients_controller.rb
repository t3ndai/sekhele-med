class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :set_lab_branch, only: %i[ index new create ]

  inertia_share flash: -> { flash.to_hash }

  # GET /patients
  def index
    @patients = @lab_branch.patients
    render inertia: "Patient/Index", props: {
      patients: @patients.map do |patient|
        serialize_patient(patient)
      end
    }
  end

  # GET /patients/1
  def show
    render inertia: "Patient/Show", props: {
      patient: serialize_patient(@patient),
      patients_url: lab_branch_patients_url(@patient.lab_branch)
    }
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    render inertia: "Patient/New", props: {
      patient: serialize_patient(@patient),
      lab_branch_id: @lab_branch.id
    }
  end

  # GET /patients/1/edit
  def edit
    render inertia: "Patient/Edit", props: {
      patient: serialize_patient(@patient)
    }
  end

  # POST /patients
  def create
    @patient = Patient.new(patient_params.except(:emergency_contact))
    @patient.lab_branch = @lab_branch
    emergency_contact = params.dig(:patient, :emergency_contact)
    @patient.emergency_contact= emergency_contact

    if @patient.save
      redirect_to @patient, notice: "Patient was successfully created."
    else
      puts @patient.errors.full_messages
      redirect_to new_lab_branch_patient_url(@lab_branch), inertia: { errors: @patient.errors }
    end
  end

  # PATCH/PUT /patients/1
  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient was successfully updated."
    else
      redirect_to edit_patient_url(@patient), inertia: { errors: @patient.errors }
    end
  end

  # DELETE /patients/1
  def destroy
    @patient.destroy!
    redirect_to patients_url, notice: "Patient was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def set_lab_branch
      @lab_branch = LabBranch.find(params[:lab_branch_id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:first_name, :middle_names, :last_name, :dob, :address, :email, :phone, :lab_branch_id, emergency_contact: [ [ :name, :phone, :relationship ] ])
    end

    def serialize_patient(patient)
      patient.as_json(only: [
        :id, :first_name, :middle_names, :last_name, :dob, :address, :email, :phone, :lab_branch_id, emergency_contact: {}
      ])
    end
end
