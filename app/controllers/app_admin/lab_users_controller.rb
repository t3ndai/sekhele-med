class AppAdmin::LabUsersController < ApplicationController
  before_action :set_lab_user, only: %i[ show edit update destroy ]
  before_action :set_lab, only: %i[ new create ]

  inertia_share flash: -> { flash.to_hash }

  # GET /lab_users
  def index
    @lab_users = LabUser.all
    render inertia: "LabUser/Index", props: {
      lab_users: @lab_users.map do |lab_user|
        serialize_lab_user(lab_user)
      end
    }
  end

  # GET /lab_users/1
  def show
    render inertia: "LabUser/Show", props: {
      lab_user: serialize_lab_user(@lab_user)
    }
  end

  # GET /lab_users/new
  def new
    @lab_user = LabUser.new

    render inertia: "LabUser/NewLabAdmin", props: {
      lab_user: serialize_lab_user(@lab_user),
      lab_id: @lab.id
    }
  end

  # GET /lab_users/1/edit
  def edit
    render inertia: "LabUser/Edit", props: {
      lab_user: serialize_lab_user(@lab_user)

    }
  end

  # POST /lab_users
  def create
    @lab_user = LabUser.new(lab_user_params)
    @lab_user.lab = @lab

    if @lab_user.save
      send_invitation(@lab_user)
      redirect_to app_admin_lab_lab_user_url(@lab, @lab_user), notice: "Lab user was successfully created."
    else
      redirect_to new_lab_user_url, inertia: { errors: @lab_user.errors }
    end
  end

  # PATCH/PUT /lab_users/1
  def update
    if @lab_user.update(lab_user_params)
      redirect_to app_admin_lab_lab_user_url(@lab, @lab_user), notice: "Lab user was successfully updated."
    else
      redirect_to edit_lab_user_url(@lab_user), inertia: { errors: @lab_user.errors }
    end
  end

  # DELETE /lab_users/1
  def destroy
    @lab_user.destroy!
    redirect_to lab_users_url, notice: "Lab user was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab_user
      @lab_user = LabUser.find(params[:id])
    end

    def set_lab
      @lab = Lab.find(params[:lab_id])
    end

    # Only allow a list of trusted parameters through.
    def lab_user_params
      params.require(:lab_user).permit(:name, :email, :username)
    end

    def serialize_lab_user(lab_user)
      lab_user.as_json(only: [
        :id, :name, :email, :username
      ])
    end

    def send_invitation(lab_user)
      UserMailer.invite_to_org(lab_user).deliver_later
    end
end
