class Answer < ApplicationRecord
  belongs_to :question
  
  validates :name, presence: true
  validates :name, uniqueness: { scope: :question_id }
end