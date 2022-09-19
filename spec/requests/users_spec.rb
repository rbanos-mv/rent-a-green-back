require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'Users', type: :request do
  include_context 'common_context'

  describe 'action users#current' do
    before(:each) do
      get users_current_path, headers:
    end

    context 'when logged in' do
      it 'returns http_success' do
        expect(response).to have_http_status(:success)
      end

      it 'header "Content-Type" contains application/json' do
        expect(response.header['Content-Type']).to include('application/json')
      end

      it 'returns current user info' do
        @body = JSON.parse(response.body)
        expect(@body['name']).to eq 'Roberto'
        expect(@body['email']).to eq 'roberto@mail.com'
      end
    end
  end
end
