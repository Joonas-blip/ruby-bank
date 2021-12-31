# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# destroy all users
Transaction.destroy_all
BankAccount.destroy_all
User.destroy_all

puts 'create users'
user_1 = User.new(email: 'User1@mail.com', password: '123456', full_name: 'John Doe')
user_1.save
user_2 =User.new(email: 'User2@mail.com', password: '123456', full_name: 'Davide Oldani')
user_2.save
admin = User.new(email: 'admin@mail.com',  password: '123456', full_name: 'BANK ADMIN', admin: true)
admin.save
puts 'users created'

puts 'create bank accounts'
bank = BankAccount.create(user: user_1)
bank.save
BankAccount.create(user: user_2)
BankAccount.create(user: admin, balance: Float::INFINITY)
puts 'Bank accounts created'

puts 'Create transactions'
deposit = Transaction.new(sender_id: BankAccount.third.id, receiver_id: BankAccount.first.id, amount: 100, transaction_type: 'deposit')
deposit.save
3.times do
  transaction1 = Transaction.new(sender_id: BankAccount.first.id, receiver_id: BankAccount.second.id, amount: 10)
  transaction1.save
  transaction1 = Transaction.new(sender_id: BankAccount.second.id, receiver_id: BankAccount.first.id, amount: 10)
  transaction1.save
  sleep(5)
end
puts 'Transactions created'
