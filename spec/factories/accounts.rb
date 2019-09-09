FactoryBot.define do
  factory :account do
    name { Faker::Lorem.word }
    balance { Faker::Number.decimal(l_digits: 2) }
    user_id { nil }
  end
end
