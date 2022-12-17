class StatusHistory < ApplicationRecord
  self.table_name = "status_history"

  belongs_to :applicant

  validates :comment, :current_status, :previous_status, presence: true
end
