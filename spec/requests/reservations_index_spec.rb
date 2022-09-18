require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'Reservations Index', type: :request do
  include_context 'common_context'
  describe 'GET reservations_path' do
    it 'Reservations: returns http status :success' do
      get reservations_path
      expect(response).to have_http_status(:success)
    end

    it 'Reservations: returns 2 reservations' do
      get reservations_path
      response_json = JSON.parse(response.body)
      expect(response_json.length).to eq(2)
    end
  end
end
