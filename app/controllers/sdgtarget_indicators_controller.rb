class SdgtargetIndicatorsController < ApplicationController
  before_action :set_and_authorize_sdgtarget_indicator, only: [:show, :update, :destroy]

  # GET /sdgtarget_categories
  def index
    @sdgtarget_categories = policy_scope(SdgtargetIndicator).order(created_at: :desc).page(params[:page])
    authorize @sdgtarget_categories

    render json: @sdgtarget_categories
  end

  # GET /sdgtarget_categories/1
  def show
    render json: @sdgtarget_indicator
  end

  # POST /sdgtarget_categories
  def create
    @sdgtarget_indicator = SdgtargetIndicator.new
    @sdgtarget_indicator.assign_attributes(permitted_attributes(@sdgtarget_indicator))
    authorize @sdgtarget_indicator

    if @sdgtarget_indicator.save
      render json: @sdgtarget_indicator, status: :created, location: @sdgtarget_indicator
    else
      render json: @sdgtarget_indicator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sdgtarget_categories/1
  def update
    render json: @sdgtarget_indicator if @sdgtarget_indicator.update_attributes!(permitted_attributes(@sdgtarget_indicator))
  end

  # DELETE /sdgtarget_categories/1
  def destroy
    @sdgtarget_indicator.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_and_authorize_sdgtarget_indicator
    @sdgtarget_indicator = policy_scope(SdgtargetIndicator).find(params[:id])
    authorize @sdgtarget_indicator
  end
end
