class PatientVisitsController < ApplicationController
  before_action :set_patient_visit, only: %i[ show edit update destroy ]
  before_action :set_patient, only: %i[ index new create ]

  inertia_share flash: -> { flash.to_hash }

  # GET /patient_visits
  def index
    @patient_visits = PatientVisit.all
    render inertia: "PatientVisit/Index", props: {
      patient_visits: @patient_visits.map do |patient_visit|
        serialize_patient_visit(patient_visit)
      end
    }
  end

  # GET /patient_visits/1
  def show
    render inertia: "PatientVisit/Show", props: {
      patient_visit: serialize_patient_visit(@patient_visit),
      patient: @patient_visit.patient.full_name,
      referrer: @patient_visit.referrer.name,
      patient_url: patient_url(@patient_visit.patient),
      patient_visit_billing_url: (patient_visit_billing_url(@patient_visit.patient_visit_billing) if @patient_visit.patient_visit_billing)
    }
  end

  # GET /patient_visits/new
  def new
    @patient_visit = PatientVisit.new
    referrers = @patient.lab_branch.referrers.map do |referrer|
      { id: referrer.id, name: referrer.name }
    end

    render inertia: "PatientVisit/New", props: {
      patient_visit: serialize_patient_visit(@patient_visit),
      referrers:,
      patient_id: @patient.id,
      lab_branch_patients_url: lab_branch_patients_url(@patient.lab_branch)
    }
  end

  # GET /patient_visits/1/edit
  def edit
    render inertia: "PatientVisit/Edit", props: {
      patient_visit: serialize_patient_visit(@patient_visit)
    }
  end

  # POST /patient_visits
  def create
    @patient_visit = PatientVisit.new(patient_visit_params)
    @patient_visit.patient = @patient

    if params[:patient_visit][:docs]
      docs = params[:patient_visit][:docs].values
      docs.each do |doc|
        @patient_visit.docs.attach(doc)
      end
    end

    if @patient_visit.save
      redirect_to @patient_visit, notice: "Patient visit was successfully created."
    else
      redirect_to new_patient_visit_url, inertia: { errors: @patient_visit.errors }
    end
  end

  # PATCH/PUT /patient_visits/1
  def update
    if @patient_visit.update(patient_visit_params)
      redirect_to @patient_visit, notice: "Patient visit was successfully updated."
    else
      redirect_to edit_patient_visit_url(@patient_visit), inertia: { errors: @patient_visit.errors }
    end
  end

  # DELETE /patient_visits/1
  def destroy
    @patient = @patient_visit.patient
    @patient_visit.destroy!
    redirect_to patient_patient_visits_url(@patient), notice: "Patient visit was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_visit
      @patient_visit = PatientVisit.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    # Only allow a list of trusted parameters through.
    def patient_visit_params
      params.require(:patient_visit).permit(:patient_id, :referrer_id, :visit_type, :allergies, :medicines, :vitals, :request_pad, :visit_time, docs: [])
    end

    def serialize_patient_visit(patient_visit)
      patient_visit.as_json(only: [
        :id, :patient_id, :referrer_id, :visit_type, :allergies, :medicines, :vitals, :visit_time
      ]).tap do |hash|
        hash["request_pad"] = { filename: patient_visit.request_pad.filename, url: url_for(patient_visit.request_pad) } if patient_visit.request_pad.attached?
        hash["docs"] =
          patient_visit.docs.flat_map do |file|
            { filename: file.filename.to_s, url: url_for(file) }
          end
      end
    end
end
