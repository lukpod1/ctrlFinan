FactoryBot.define do
  factory :user do
    username { Faker::JapaneseMedia::OnePiece.character }
    email { Faker::Internet.email }
    password { 12345678 }
  end
end
