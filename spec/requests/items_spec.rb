require 'rails_helper'
require_relative '../shared_file'

RSpec.describe 'Items Controller', :type => :request do
  include_context 'common_context'

  describe 'GET paths' do
    it 'Returns :success for Index' do
      get items_path
      expect(response).to have_http_status(:success)
    end

    it 'Returns :success for Show' do
      element = Item.first
      get item_path(element.id)
      expect(response).to have_http_status(:success)
    end

    it 'Index shows all items' do
      get items_path
      response_json = JSON.parse(response.body)
      expect(response_json.length).to eq(5)
    end

    it 'Shows selected item only' do
      element = Item.first
      get item_path(element.id)
      response_json = JSON.parse(response.body)
      p response_json
      expect(response_json).to include('name' => element.name)
    end

    it 'Returns all items with correct attributes' do
      get items_path
      response_json = JSON.parse(response.body)
      response_json.each do |item|
        expect(item.keys).to include('id', 'name', 'photo', 'description', 'range', 'active')
      end
    end

    it 'creates a new item' do
      post items_path, params: { item: { name: 'TESLA', photo: 'https://www.bmw.com/content/dam/bmw/common/all-models/i4/2021/navigation/bmw-i4-2021-model-card.png', description: 'The BMW i4 is a four-door, five-seat, all-electric fastback sedan that will be produced by BMW in Munich, Germany, and will be available in the United States, Canada, and Europe.', range: 600 } }.to_json, headers: headers
      expect(response).to have_http_status(:created)
    end

    it 'toggle active' do
      element = Item.first
      post toggle_active_item_path(element.id)
      expect(response).to have_http_status(:accepted)
    end
  end
end
