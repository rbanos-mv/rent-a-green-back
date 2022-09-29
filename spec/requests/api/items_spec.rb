require 'swagger_helper'

RSpec.describe 'items', type: :request do
  after(:all) do
    Reservation.destroy_all
    Item.destroy_all
    User.destroy_all
  end

  let(:user) { create(:user) }

  path '/items' do
    get('list items') do
      tags 'Items'
      produces 'application/json'

      response(200, 'Successful') do
        before { create_list(:item, 1) }
        example 'application/json', :successful, {
          code: 200,
          data: [
            {
              id: '1',
              type: 'item',
              attributes: {
                id: 1,
                name: 'Item 100',
                description: 'description 100',
                range: '100 mi',
                photo: 'photo1_url'
              }
            }
          ]
        }
        run_test!
      end
    end

    post('create item') do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          range: { type: :string },
          photo: { type: :string }
        },
        required: %w[name description range photo]
      }
      security [bearerAuth: []]

      response(201, 'successful') do
        let(:Authorization) { generate_jwt_token_for(user) }
        let(:item) { attributes_for(:item) }
        example 'application/json', :successful, {
          code: 201,
          data: {
            id: 6,
            name: "This is the item's name",
            description: 'This is the description',
            range: '100 mi',
            photo: 'http://photo_url'
          }
        }
        run_test!
      end
    end
  end

  path '/items/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show item') do
      tags 'Items'
      response(200, 'successful') do
        let(:id) { create(:item).id }
        example 'application/json', :successful, {
          code: 200,
          data: {
            id: 6,
            name: "This is the item's name",
            description: 'This is the description',
            range: '100 mi',
            photo: 'http://photo_url'
          }
        }
        run_test!
      end
    end

    delete('delete item') do
      tags 'Items'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'id'
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:Authorization) { generate_jwt_token_for(user) }
        let(:id) { create(:item).id }
        example 'application/json', :successful, {
          code: 200,
          data: {
            message: 'deleted successfully'
          }
        }
        run_test!
      end
    end
  end
end
