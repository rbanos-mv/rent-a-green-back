FactoryBot.define do
  factory :item do
    name { 'Item 1' }
    description { 'This is the description' }
    range { '100 miles approx' }
    photo { 'http://photo_url' }
  end
end
