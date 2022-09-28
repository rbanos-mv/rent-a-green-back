require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/users/signup' do
    post('new registration') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string, pattern: '^\S+@\S+\.\S+$', format: :email },
              password: { type: :string, format: :password }
            },
            required: %w[name email password]
          }
        },
        required: %w[user]
      }

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
  end

  path '/users/login' do
    post('create session') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, pattern: '^\S+@\S+\.\S+$', format: :email },
              password: { type: :string, format: :password }
            },
            required: %w[email password]
          }
        },
        required: %w[user]
      }

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
  end

  path '/users/logout' do
    delete('delete session') do
      tags 'Users'
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
end
