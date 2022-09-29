FactoryBot.define do
  factory :reservation do
    user
    item { 'Item 1' }
    date { Date.today }
    city { 'City' }
  end
end
