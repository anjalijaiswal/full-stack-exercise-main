require 'rails_helper'

RSpec.describe StatusHistory, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:comment) }
    it { is_expected.to validate_presence_of(:current_status) }
    it { is_expected.to validate_presence_of(:previous_status) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:applicant) }
  end
end
