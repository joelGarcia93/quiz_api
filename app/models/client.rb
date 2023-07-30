class Client < ApplicationRecord
  has_many :client_answers
  has_many :answers, through: :client_answers
end