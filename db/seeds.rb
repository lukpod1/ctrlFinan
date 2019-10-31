# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Criando usuário'
User.create!(username: "admin", email: 'admin@admin.com', password: "12345678", password_confirmation: "12345678" )
puts 'Usuário criado.'

if Rails.env != 'production'
  puts 'Criando contas.'
  10.times do
    Account.create!(name: Faker::Lorem.word, balance_cents: Faker::Number.number(digits: 4), user_id: User.first.id)
  end
  puts 'Contas criadas.'
end