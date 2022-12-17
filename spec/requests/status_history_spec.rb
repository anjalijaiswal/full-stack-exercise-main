require 'rails_helper'

RSpec.describe "StatusHistories", type: :request do
  describe "GET /index" do
    let(:fund) do
      Fund.create!(
        title: 'Fund',
        total: 10_000
      )
    end
  
    let(:project) do
      Project.create!(
        payment_date: Date.current + 1.month,
        title: 'Project',
        fund:
      )
    end
  
    let(:applicant) do
      Applicant.create!(
        name: 'Applicant Name',
        overview: 'Overview',
        funding: 500,
        project_id: project.id,
        status: 'initial_review'
      )
    end
  
    let(:valid_attributes) do
      {
        comment: 'Some Comment',
        applicant_id: applicant.id,
        current_status: 'applied',
        changed_status: 'initial_review',
      }
    end

    it "returns http success" do
      StatusHistory.create! valid_attributes
      get status_history_index_path, params: { applicant_id: applicant.id }
      
      expect(response).to have_http_status(:success)
    end
  end

end