# spec/models/applicant_spec.rb

require 'rails_helper'

RSpec.describe Applicant, :type => :model do
	describe "#project_title" do
		let(:project) { Project.create }
		let(:applicant) { Applicant.create(project: project) }

		it 'returns valid project title' do
			expect(applicant.project_title).to eq(project.title)
		end
	end
end