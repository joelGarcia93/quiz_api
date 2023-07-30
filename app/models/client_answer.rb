class ClientAnswer < ApplicationRecord
  belongs_to :client
  belongs_to :answer, optional: true

  validates :client_id, uniqueness: { scope: :answer_id }, if: -> { answer_id.present? }
  scope :result, -> (client_id) { joins(:answer).where(client_id: client_id, answer: { is_correct: true }).count }
end