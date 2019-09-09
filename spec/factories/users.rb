FactoryBot.define do
  factory :user do
    name { Faker::JapaneseMedia::OnePiece.character }
    email { Faker::Internet.email }
    password { 12345678 }
    password_confirmation { 12345678 }
  end
end
