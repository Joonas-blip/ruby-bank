class BankAccount < ApplicationRecord
  before_validation :set_default_balance
  belongs_to :user
  has_many :transactions
  validates :account_number, presence: true, uniqieness: true
  validates :user, presence: true

  def set_default_balance
    if self.new_record?
      self.balance = 0.00
    end
  end
end
