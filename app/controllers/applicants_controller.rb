# frozen_string_literal: true

# Controller for CRUD management of Applicants
class ApplicantsController < ApplicationController
  before_action :set_applicant, only: %i[show edit update destroy]

  # GET /applicants
  def index
    @applicants = Applicant.order(:name)
  end

  # GET /applicants/1
  def show; end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit
    @status_history = @applicant.status_history.build
  end

  # POST /applicants
  def create
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
      redirect_to @applicant, notice: 'Applicant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applicants/1
  def update
    set_applicant_status_history if verify_status_change?

    if @applicant.errors.blank? && @applicant.update(applicant_params.except(:status_history))
      redirect_to @applicant, notice: 'Applicant was successfully updated.'
    else
      @status_history = @applicant.status_history.build
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /applicants/1
  def destroy
    @applicant.destroy
    redirect_to applicants_url, notice: 'Applicant was successfully destroyed.'
  end

  private

  def set_applicant_status_history
    if applicant_params[:status_history] && applicant_params[:status_history][:comment].blank?
      @applicant.errors.add(:base, "Status change comment can't be blank") and return
    end

    @applicant.status_history.create(
      current_status: Applicant.statuses[applicant_params[:status]],
      previous_status: @applicant.status,
      comment: applicant_params[:status_history][:comment]
    )
  end

  def verify_status_change?
    return false if applicant_params[:status].blank? || applicant_params[:status] == @applicant.status

    true
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def applicant_params
    params.require(:applicant).permit(:name, :overview, :funding, :project_id, :status, status_history: [:comment])
  end
end
