require 'rails_helper'
require_relative '../shared_file'

RSpec.describe Reservation, type: :model do
  include_context 'model_context'

  it 'New Reservation is valid' do
    new_res = Reservation.new(city: 'Boston', date: '2022/02/22', user: User.first, item: Item.first)
    expect(new_res).to be_valid
  end

  it 'New Reservation is not valid without city' do
    new_res = Reservation.new(date: '22/02/2022', user: User.first, item: Item.first)
    expect(new_res).to_not be_valid
  end

  it 'New Reservation is not valid without date' do
    new_res = Reservation.new(city: 'Boston', user: User.first, item: Item.first)
    expect(new_res).to_not be_valid
  end
end
