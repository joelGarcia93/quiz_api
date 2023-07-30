require 'rails_helper'

RSpec.describe 'ClientAnswersRequests', type: :request do
  let(:client) { FactoryBot.create(:client) }
  let(:question) { FactoryBot.create(:question, :one) }
  let(:answer) { question.answers.first }

  describe 'POST create /api/v1/client_answers' do
    context 'when is valid' do
      it 'returns status 201 and json message' do
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: answer.id } }

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq(I18n.t('client_answers.create.success'))
      end
    end

    context 'when is invalid' do
      it 'returns status 422 and json errors' do
        post api_v1_client_answers_path, params: { client_answer: { client_id: nil, answer_id: answer.id } }

        expect(response).not_to be_successful
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end

  describe 'GET result api/v1/client_answers/result' do
    let(:question_two) { FactoryBot.create(:question, :two) }
    let(:question_three) { FactoryBot.create(:question, :three) }
    let(:question_four) { FactoryBot.create(:question, :four) }
    let(:question_five) { FactoryBot.create(:question, :five) }

    context 'with 1 correct answers and 4 incorrect' do
      before do
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_two.incorrect_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_three.incorrect_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_four.incorrect_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_five.incorrect_answer.id } }
      end

      it 'result number is 1' do
        get result_api_v1_client_answers_path, params: { client_id: client.id }

        expect(JSON.parse(response.body)['result']).to eq(1)
      end
    end

    context 'with 3 correct answers and 2 incorrect' do
      before do
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_two.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_three.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_four.incorrect_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_five.incorrect_answer.id } }
      end

      it 'result number is 3' do
        get result_api_v1_client_answers_path, params: { client_id: client.id }

        expect(JSON.parse(response.body)['result']).to eq(3)
      end
    end

    context 'with all correct answers' do
      before do
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_two.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_three.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_four.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_five.correct_answer.id } }
      end

      it 'result number is 5' do
        get result_api_v1_client_answers_path, params: { client_id: client.id }

        expect(JSON.parse(response.body)['result']).to eq(5)
      end
    end

    context 'with 1 correct answers and 2 incorrect and 2 nil (incorrect too)' do
      before do
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question.correct_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_two.incorrect_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: question_three.incorrect_answer.id } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: nil } }
        post api_v1_client_answers_path, params: { client_answer: { client_id: client.id, answer_id: nil } }
      end

      it 'result number is 1' do
        get result_api_v1_client_answers_path, params: { client_id: client.id }

        expect(JSON.parse(response.body)['result']).to eq(1)
      end
    end
  end
end
