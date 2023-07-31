class Api::V1::ClientAnswersController < ApplicationController
  def create
    client_answer = ClientAnswer.new(client_answer_params)

    if client_answer.save
      render json: { message: I18n.t('client_answers.create.success') }, status: :created
    else
      render json: { errors: client_answer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def result
    result = ClientAnswer.result(params[:client_id])

    render json: { result: result, questions_count: Question.count }, status: :ok
  end

  private
  def client_answer_params
    params.require(:client_answer).permit(:client_id, :answer_id)
  end
end