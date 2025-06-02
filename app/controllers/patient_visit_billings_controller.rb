class PatientVisitBillingsController < ApplicationController
  before_action :set_patient_visit_billing, only: %i[ show edit update destroy ]
  before_action :set_patient_visit, only: %i[ index new create ]

  inertia_share flash: -> { flash.to_hash }

  # GET /patient_visit_billings
  def index
    @patient_visit_billings = PatientVisitBilling.all
    render inertia: "PatientVisitBilling/Index", props: {
      patient_visit_billings: @patient_visit_billings.map do |patient_visit_billing|
        serialize_patient_visit_billing(patient_visit_billing)
      end
    }
  end

  # GET /patient_visit_billings/1
  def show
    render inertia: "PatientVisitBilling/Show", props: {
      patient_visit_billing: serialize_patient_visit_billing(@patient_visit_billing),
      patient_visit_url: patient_visit_url(@patient_visit_billing.patient_visit)
    }
  end

  # GET /patient_visit_billings/new
  def new
    @patient_visit_billing = @patient_visit.build_patient_visit_billing
    @patient_visit_billing.status = "pending"
    @patient_visit_billing.amount_due = @patient_visit.procedures.sum(:cost)
    @patient_visit_billing.amount_paid = 0

    payment_methods = PatientVisitBilling.payment_methods.keys.map do |method|
      { value: method, label: method.humanize }
    end

    render inertia: "PatientVisitBilling/New", props: {
      patient_visit_billing: serialize_patient_visit_billing(@patient_visit_billing),
      payment_methods:,
      patient_visit_id: @patient_visit.id,
      patient_visit_url: patient_visit_url(@patient_visit_billing.patient_visit)
    }
  end

  # GET /patient_visit_billings/1/edit
  def edit
    render inertia: "PatientVisitBilling/Edit", props: {
      patient_visit_billing: serialize_patient_visit_billing(@patient_visit_billing)
    }
  end

  # POST /patient_visit_billings
  def create
    @patient_visit_billing = PatientVisitBilling.new(patient_visit_billing_params)
    @patient_visit_billing.patient_visit = @patient_visit
    images = params[:patient_visit_billing][:proof].values
    images.each do |image|
      @patient_visit_billing.proof.attach(image)
    end
    @patient_visit_billing.status = "paid" if @patient_visit_billing.proof.attached?

    if @patient_visit_billing.save
      redirect_to @patient_visit_billing, notice: "Patient billed successfully."
    else
      redirect_to new_patient_visit_billing_url, inertia: { errors: @patient_visit_billing.errors }
    end
  end

  # PATCH/PUT /patient_visit_billings/1
  def update
    if @patient_visit_billing.update(patient_visit_billing_params)
      redirect_to @patient_visit_billing, notice: "Patient visit billing was successfully updated."
    else
      redirect_to edit_patient_visit_billing_url(@patient_visit_billing), inertia: { errors: @patient_visit_billing.errors }
    end
  end

  # DELETE /patient_visit_billings/1
  def destroy
    @patient_visit = @patient_visit_billing.patient_visit
    @patient_visit_billing.destroy!
    redirect_to @patient_visit, notice: "Patient visit billing was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_visit_billing
      @patient_visit_billing = PatientVisitBilling.find(params[:id])
    end

    def set_patient_visit
      @patient_visit = PatientVisit.find(params[:patient_visit_id])
    end

    # Only allow a list of trusted parameters through.
    def patient_visit_billing_params
      params.require(:patient_visit_billing).permit(:amount_due, :amount_paid, :status, :payment_method, :patient_visit_id, proof: [])
    end

    def serialize_patient_visit_billing(patient_visit_billing)
      patient_visit_billing.as_json(only: [
        :id, :amount_due, :amount_paid, :status, :payment_method, :patient_visit_id
      ]).tap do |hash|
        hash["proof"] =
          patient_visit_billing.proof.flat_map do |file|
            { filename: file.filename.to_s, url: url_for(file) }
          end
      end
    end
end
