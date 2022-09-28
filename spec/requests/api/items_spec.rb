require 'swagger_helper'

RSpec.describe 'items', type: :request do
  path '/items' do
    get('list items') do
      tags 'Items'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        #run_test!
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

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        #run_test!
      end
    end
  end

  path '/items/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show item') do
      tags 'Items'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        #run_test!
      end
    end

    delete('delete item') do
      tags 'Items'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'id'
      security [bearerAuth: []]
      response(200, 'successful') do
        let(:Authorization) { "Bearer #{token_for(user)}" }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        #run_test!
      end
    end
  end
end
