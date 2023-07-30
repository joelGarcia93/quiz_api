class Api::V1::QuestionsController < ApplicationController
  def index
    questions = Question.all.order(order: :asc)
    render json: Api::V1::QuestionBlueprint.render(questions), status: :ok
  end
end