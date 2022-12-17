class StatusHistoryController < ApplicationController
  before_action :applicant, only: [:index]

  def index
    @status_history = @applicant.status_history.order(created_at: :desc)
  end

  private

  def applicant
    @applicant ||= Applicant.find(params[:applicant_id])
  end
end
