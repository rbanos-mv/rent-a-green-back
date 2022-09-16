shared_context 'common_context' do
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
end
