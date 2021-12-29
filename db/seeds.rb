# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# destroy all users
User.destroy_all
BankAccount.destroy_all

puts 'create users'
user_1 = User.new(email: 'User1@mail.com', password: '123456', full_name: 'John Doe')
user_1.save
user_2 =User.new(email: 'User2@mail.com', password: '123456', full_name: 'Andrea Corbetta')
user_2.save
admin = User.new(email: 'admin@mail.com',  password: '123456', full_name: 'Davide Oldani', admin: true)
admin.save
puts 'users created'

puts 'create bank accounts'
BankAccount.create(user: user_1)
BankAccount.create(user: user_2)
BankAccount.create(user: admin)
puts 'Bank accounts created'
