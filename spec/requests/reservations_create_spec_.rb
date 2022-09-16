require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'Reservations Create', type: :request do
  let!(:user) { User.order(:id).first }

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    Reservation.destroy_all
    Item.destroy_all
    User.destroy_all
  end

  before(:each) do
    login_as(user)
  end

  after(:each) do
    logout
  end
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

    it 'Reservations create: returns message of successful creation' do
      post reservations_path, params: {
        reservation: {
          city: 'Orlando',
          date: '2022/12/12',
          item: 'BMW i4'
        }
      }
      response_json = JSON.parse(response.body)
      expect(response_json['message']).to eq('Reservation created successfully!')
    end

    it 'Reservations create: returns message of creation failure' do
      post reservations_path, params: {
        reservation: {
          city: 'Orlando',
          date: '2022/12/12',
          item: 'ITEM NO EXISTE'
        }
      }
      response_json = JSON.parse(response.body)
      expect(response_json['message']).to eq('Reservation is not valid.')
    end
  end
end
