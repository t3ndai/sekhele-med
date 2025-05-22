class ReferrersController < ApplicationController
  before_action :set_referrer, only: %i[ show edit update destroy ]
  before_action :set_lab_branch, only: %i[ new create ]

  inertia_share flash: -> { flash.to_hash }

  # GET /referrers
  def index
    @referrers = Referrer.all
    render inertia: "Referrer/Index", props: {
      referrers: @referrers.map do |referrer|
        serialize_referrer(referrer)
      end
    }
  end

  # GET /referrers/1
  def show
    render inertia: "Referrer/Show", props: {
      referrer: serialize_referrer(@referrer)
    }
  end

  # GET /referrers/new
  def new
    @referrer = Referrer.new
    render inertia: "Referrer/New", props: {
      referrer: serialize_referrer(@referrer),
      lab_branch_id: @lab_branch.id
    }
  end

  # GET /referrers/1/edit
  def edit
    render inertia: "Referrer/Edit", props: {
      referrer: serialize_referrer(@referrer)
    }
  end

  # POST /referrers
  def create
    @referrer = Referrer.new(referrer_params)
    @referrer.share_code = SecureRandom.hex(3)
    @referrer.lab_branch = @lab_branch

    if @referrer.save
      redirect_to @referrer, notice: "Referrer was successfully created."
    else
      redirect_to new_referrer_url, inertia: { errors: @referrer.errors }
    end
  end

  # PATCH/PUT /referrers/1
  def update
    if @referrer.update(referrer_params)
      redirect_to @referrer, notice: "Referrer was successfully updated."
    else
      redirect_to edit_referrer_url(@referrer), inertia: { errors: @referrer.errors }
    end
  end

  # DELETE /referrers/1
  def destroy
    @referrer.destroy!
    redirect_to referrers_url, notice: "Referrer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referrer
      @referrer = Referrer.find(params[:id])
    end

    def set_lab_branch
      @lab_branch = LabBranch.find(params[:lab_branch_id])
    end

    # Only allow a list of trusted parameters through.
    def referrer_params
      params.require(:referrer).permit(:lab_branch_id, :share_code, :name, :address, :email, :phone)
    end

    def serialize_referrer(referrer)
      referrer.as_json(only: [
        :id, :lab_branch_id, :share_code, :name, :address, :email, :phone
      ])
    end
end
