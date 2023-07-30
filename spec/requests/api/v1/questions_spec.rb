require 'rails_helper'

RSpec.describe 'QuestionsRequests', type: :request do
  describe 'GET index /api/v1/questions' do
    let(:question_one) { FactoryBot.create(:question, :one) }
    let(:question_two) { FactoryBot.create(:question, :two) }

    it 'returns status 200 and json array serialized' do
      get api_v1_questions_path, params: {}

      expect(response).to have_http_status(:ok)
      expect(response).to match_json_schema('api/v1/questions')
    end
  end
end
