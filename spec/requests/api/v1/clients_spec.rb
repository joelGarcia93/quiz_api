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
end
