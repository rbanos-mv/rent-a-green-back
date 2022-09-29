require 'devise/jwt/test_helpers'

def headers_jwt_token_for(user)
  headers = { 'Content-Type' => 'application/json' }
  Devise::JWT::TestHelpers.auth_headers(headers, user)
end

def generate_jwt_token_for(user)
  headers_jwt_token_for(user)['Authorization']
end
