class LabAdmin::LabBranchUsersController < ApplicationController
  before_action :set_lab_branch_user, only: %i[ show edit update destroy ]
  before_action :set_lab_branch, only: %i[ index new create update  ]

  inertia_share flash: -> { flash.to_hash }

  # GET /lab_branch_users
  def index
    @lab_branch_users = @lab_branch.lab_branch_users
    render inertia: "LabBranchUser/Index", props: {
      lab_branch_users: @lab_branch_users.map do |lab_branch_user|
        serialize_lab_branch_user(lab_branch_user)
      end,
      lab_branch_id: @lab_branch.id,
      branch_name: @lab_branch.name
    }
  end

  # GET /lab_branch_users/1
  def show
    render inertia: "LabBranchUser/Show", props: {
      lab_branch_user: serialize_lab_branch_user(@lab_branch_user)
    }
  end

  # GET /lab_branch_users/new
  def new
    @lab_branch_user = LabBranchUser.new
    render inertia: "LabBranchUser/New", props: {
      lab_branch_user: serialize_lab_branch_user(@lab_branch_user),
      lab_branch_id: @lab_branch.id
    }
  end

  # GET /lab_branch_users/1/edit
  def edit
    render inertia: "LabBranchUser/Edit", props: {
      lab_branch_user: serialize_lab_branch_user(@lab_branch_user)
    }
  end

  # POST /lab_branch_users
  def create
    @lab_branch_user = LabBranchUser.new(lab_branch_user_params)
    @lab_branch_user.lab_branch = @lab_branch

    docs = params[:lab_branch_user][:documents].values
    docs.each do |doc|
      @lab_branch_user.documents.attach(doc)
    end

    if @lab_branch_user.save
      send_invitation(@lab_branch_user)
      redirect_to lab_admin_lab_branch_user_url(@lab_branch_user), notice: "Lab branch user was successfully created."
    else
      redirect_to new_lab_branch_user_url, inertia: { errors: @lab_branch_user.errors }
    end
  end

  # PATCH/PUT /lab_branch_users/1
  def update
    if @lab_branch_user.update(lab_branch_user_params)
      redirect_to @lab_branch_user, notice: "Lab branch user was successfully updated."
    else
      redirect_to edit_lab_branch_user_url(@lab_branch_user), inertia: { errors: @lab_branch_user.errors }
    end
  end

  # DELETE /lab_branch_users/1
  def destroy
    @lab_branch = @lab_branch_user.lab_branch
    @lab_branch_user.destroy!
    redirect_to lab_admin_lab_branch_lab_branch_users_url(@lab_branch), notice: "Lab branch user was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_branch_user
      @lab_branch_user = LabBranchUser.find(params[:id])
    end

    def set_lab_branch
      @lab_branch = LabBranch.find(params[:lab_branch_id])
    end

    # Only allow a list of trusted parameters through.
    def lab_branch_user_params
      params.require(:lab_branch_user).permit(:lab_branch_id, :first_name, :middle_names, :last_names, :role_type, :phone, :email, :address, documents: [])
    end

    def send_invitation(lab_user)
      UserMailer.invite_to_org(lab_user).deliver_later
    end

    def serialize_lab_branch_user(lab_branch_user)
      lab_branch_user.as_json(only: [
        :id, :lab_branch_id, :first_name, :middle_names, :last_names, :role_type, :phone, :email, :address, :name
      ]).tap do |hash|
        hash["documents"] =
          lab_branch_user.documents.flat_map do |file|
            { filename: file.filename.to_s, url: url_for(file) }
          end
      end
    end
end
