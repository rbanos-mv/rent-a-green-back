FactoryBot.define do
  factory :user do
    sequence(:name, 'a') do |n|
      "User #{n}"
    end
    sequence :email do |n|
      "user#{n}@mail.com"
    end
    password { 'valid-password' }
  end
end
