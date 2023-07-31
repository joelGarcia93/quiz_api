class Answer < ApplicationRecord
  belongs_to :question
  has_many :client_answers
  
  validates :name, presence: true
  validates :name, uniqueness: { scope: :question_id }
end