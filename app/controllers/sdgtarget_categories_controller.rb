class SdgtargetCategoriesController < ApplicationController
  before_action :set_and_authorize_sdgtarget_category, only: [:show, :update, :destroy]

  # GET /sdgtarget_categories
  def index
    @sdgtarget_categories = policy_scope(SdgtargetCategory).order(created_at: :desc).page(params[:page])
    authorize @sdgtarget_categories

    render json: @sdgtarget_categories
  end

  # GET /sdgtarget_categories/1
  def show
    render json: @sdgtarget_category
  end

  # POST /sdgtarget_categories
  def create
    @sdgtarget_category = SdgtargetCategory.new
    @sdgtarget_category.assign_attributes(permitted_attributes(@sdgtarget_category))
    authorize @sdgtarget_category

    if @sdgtarget_category.save
      render json: @sdgtarget_category, status: :created, location: @sdgtarget_category
    else
      render json: @sdgtarget_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sdgtarget_categories/1
  def update
    render json: @sdgtarget_category if @sdgtarget_category.update_attributes!(permitted_attributes(@sdgtarget_category))
  end

  # DELETE /sdgtarget_categories/1
  def destroy
    @sdgtarget_category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_and_authorize_sdgtarget_category
    @sdgtarget_category = policy_scope(SdgtargetCategory).find(params[:id])
    authorize @sdgtarget_category
  end
end
