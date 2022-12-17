# frozen_string_literal: true

# Applications to Projects
class Applicant < ApplicationRecord
  attribute :status, :integer, default: 0

  validates :name, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :funding, numericality: true, presence: true

  has_many :status_history, dependent: :destroy
  belongs_to :project

  enum status: { applied: 0, initial_review: 1, more_information_required: 2, declined: 3, approved: 4 }

  def project_title
    'Project'
  end
end
