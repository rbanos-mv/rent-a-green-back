require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  after(:all) do
    Reservation.destroy_all
    Item.destroy_all
    User.destroy_all
  end

  let(:user) { create(:user) }
  let(:Authorization) { generate_jwt_token_for(user) }

  path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      produces 'application/json'
      security [bearerAuth: []]

      response(200, 'successful') do
        before { create_list(:item, 1) }
        example 'application/json', :successful, {
          code: 200,
          data: [
            {
              id: '1',
              type: 'reservation',
              attributes: {
                id: 1,
                user_id: 1,
                item_id: 1,
                date: '2022-09-21',
                city: 'Medellin'
              }
            }
          ]
        }
        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date },
          city: { type: :string },
          item: { type: :string }
        },
        required: %w[date city item]
      }
      security [bearerAuth: []]

      response(201, 'successful') do
        let!(:item) { create(:item) }
        let(:reservation) { { reservation: attributes_for(:reservation) } }
        example 'application/json', :successful, {
          code: 201,
          data: {
            id: 6,
            city: 'City',
            date: '2022-01-01',
            item: 'Item 1'
          }
        }
        run_test!
      end
    end
  end
end
