class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :answers

  def correct_answer
    answers.find_by(is_correct: true)
  end

  def incorrect_answer
    answers.find_by(is_correct: false)
  end
end