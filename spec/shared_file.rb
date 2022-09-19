require 'devise/jwt/test_helpers'

shared_context 'model_context' do
  let!(:user) { User.order(:id).first }

  let(:headers) do
    headrs = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
    # This will add a valid token for `user` in the `Authorization` header
    Devise::JWT::TestHelpers.auth_headers(headrs, user)
  end

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    Reservation.destroy_all
    Item.destroy_all
    User.destroy_all
  end
end

shared_context 'common_context' do
  include_context 'model_context'

  before(:each) do
    login_as(user)
  end

  after(:each) do
    logout
  end
end
