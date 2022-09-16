require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'New Item is valid' do
    new_item = Item.new(name: 'Item 1', description: 'Description 1', photo: 'Photo 1', range: 'Range 1')
    expect(new_item).to be_valid
  end

  it 'New Item is not valid without name' do
    new_item = Item.new(name: '', description: 'Description 1', photo: 'Photo 1', range: 'Range 1')
    expect(new_item).to_not be_valid
  end

  it 'New Item is not valid without unique name' do
    Item.create(name: 'Item 1', description: 'Description 1', photo: 'Photo 1', range: 'Range 1')
    other_item = Item.new(name: 'Item 1', description: 'Description 1', photo: 'Photo 1', range: 'Range 1')
    expect(other_item).to_not be_valid
  end

  it 'New Item is not valid without description' do
    new_item = Item.new(name: 'Item 1', photo: 'Photo 1', range: 'Range 1')
    expect(new_item).to_not be_valid
  end

  it 'New Item is not valid without photo' do
    new_item = Item.new(name: 'Item 1', description: 'Description 1', range: 'Range 1')
    expect(new_item).to_not be_valid
  end

  it 'New Item is not valid without range' do
    new_item = Item.new(name: 'Item 1', description: 'Description 1', photo: 'Photo 1')
    expect(new_item).to_not be_valid
  end
end
