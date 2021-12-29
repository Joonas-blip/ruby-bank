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

user_1 = User.create(email: 'User1@mail.com', password: '123456', full_name: 'John Doe')
user_2 =User.create(email: 'User2@mail.com', password: '123456', full_name: 'Andrea Corbetta')
admin = User.create(email: 'admin@mail.com',  password: '123456', full_name: 'Davide Oldani', admin: true)

BankAccount.create(user: user_1, account_number: 'NL01RUBY9243483368')
BankAccount.create(user: user_2, account_number: 'NL01RUBY7339065790')
BankAccount.create(user: admin, account_number: 'NL01RUBY0000000000')
