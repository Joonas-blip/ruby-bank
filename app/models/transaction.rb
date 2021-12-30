class Transaction < ApplicationRecord
  before_validation :set_transaction_number
  after_save :update_balance

  belongs_to :sender, class_name: "BankAccount"
  belongs_to :receiver, class_name: "BankAccount"

  TRANSACTION_TYPES = %w(transfer deposit)
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }
  validates :receiver_id, exclusion: { in: lambda { |transaction| [transaction.sender_id] } }

  def set_transaction_number
    self.transaction_number = SecureRandom.uuid
  end

  def update_balance
    sender = BankAccount.find(self.sender_id)
    receiver = BankAccount.find(self.receiver_id)
    sender.update(balance: sender.balance - self.amount)
    receiver.update(balance: receiver.balance + self.amount)
  end
end
