class Transaction < ApplicationRecord
  before_validation :set_transaction_number
  belongs_to :bank_account
  TRANSACTION_TYPES = %w(transfer deposit)
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }

  def set_transaction_number
    self.transaction_number = SecureRandom.uuid
  end
end
