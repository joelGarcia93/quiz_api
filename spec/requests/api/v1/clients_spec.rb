require 'rails_helper'

RSpec.describe 'ClientsRequests', type: :request do
  describe 'POST create /api/v1/clients' do
    context 'when is valid' do
      it 'returns status 201 and json serialized' do
        post api_v1_clients_path, params: { customer: {} }

        expect(response).to have_http_status(:created)
        expect(response).to match_json_schema('api/v1/client')
      end
    end
  end

  describe 'GET show /api/v1/clients/:id' do
    let(:client) { FactoryBot.create(:client) }

    context 'when is valid' do
      it 'returns 200 and json serialized' do
        get api_v1_client_path(client)

        expect(response).to have_http_status(:ok)
        expect(response).to match_json_schema('api/v1/client_detail')
      end

      context 'with answers' do
        let(:question) { FactoryBot.create(:question, :one) }
        let!(:client_answer) { FactoryBot.create(:client_answer, client: client, answer: question.correct_answer) }

        it 'returns 1 as current question due there are only 1 client_answer in the db' do
          get api_v1_client_path(client)

          expect(JSON.parse(response.body)['current_question']).to eq(1)
        end
      end

      context 'without answers' do
        it 'returns 0 as current question due there are not client_answer in the db' do
          get api_v1_client_path(client)

          expect(JSON.parse(response.body)['current_question']).to eq(0)
        end
      end
    end

    context 'when is invalid' do
      it 'returns status 404 and error message' do
        get api_v1_client_path(id: 'incorrect_id')

        expect(response).to have_http_status(:not_found)
        
        expect(JSON.parse(response.body)['errors'].include?('Record Not Found.')).to be true
      end
    end
  end
end
