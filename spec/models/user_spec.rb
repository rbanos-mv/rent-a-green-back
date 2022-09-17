require 'rails_helper'
require_relative './models_shared'

RSpec.describe User, type: :model do
  include_context 'common_context'
  describe 'name must not be blank:' do
    context 'when is nil' do
      before { user.name = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when is an empty string' do
      before { user.name = '' }

      it { is_expected.not_to be_valid }
    end

    context 'when is a blank string' do
      before { user.name = '            ' }

      it { is_expected.not_to be_valid }
    end
  end

  describe 'items:' do
    it { expect(user.items.length).to eq(2) }
  end

  describe 'reservations:' do
    it { expect(user.reservations.length).to eq(2) }
  end
end
