class UserRolesController < ApplicationController
  before_action :set_and_authorize_user_role, only: [:show, :update, :destroy]

  # GET /user_roles
  def index
    @user_roles = policy_scope(UserRole).order(created_at: :desc).page(params[:page])
    authorize @user_roles

    render json: @user_roles
  end

  # GET /@user_roles/1
  def show
    render json: @user_role
  end

  # POST /user_roles
  def create
    @user_role = UserRole.new
    @user_role.assign_attributes(permitted_attributes(@user_role))
    authorize @user_role

    if @user_role.save
      render json: @user_role, status: :created, location: @user_role
    else
      render json: @user_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_roles/1
  def update
    render json: @user_role if @user_role
                                            .update_attributes!(permitted_attributes(@user_role))
  end

  # DELETE /user_roles/1
  def destroy
    @user_role.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_and_authorize_user_role
    @user_role = policy_scope(UserRole).find(params[:id])
    authorize @user_role
  end
end
