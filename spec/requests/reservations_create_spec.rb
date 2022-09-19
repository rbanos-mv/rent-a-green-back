require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'Reservations Create', type: :request do
  include_context 'common_context'

  describe 'POST reservations_path' do
    it 'Reservations create: returns http status :success' do
      post reservations_path, params: {
        reservation: {
          city: 'Orlando',
          date: '2022/12/14',
          item: 'BMW i4'
        }
      }
      expect(response).to have_http_status(:success)
    end

    it 'Reservations create: returns status 201 (successful creation)' do
      post reservations_path, params: {
        reservation: {
          city: 'Orlando',
          date: '2022/12/12',
          item: 'BMW i4'
        }
      }
      expect(response).to have_http_status(:created)
    end

    it 'Reservations create: returns status 422 (creation failure)' do
      post reservations_path, params: {
        reservation: {
          city: 'Orlando',
          date: '2022/12/12',
          item: 'ITEM NO EXISTENTE'
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
