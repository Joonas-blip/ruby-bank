class BankAccount < ApplicationRecord
  before_validation :set_default_balance, :new_account_number
  belongs_to :user
  has_many :transactions_as_sender, class_name: "Transaction", foreign_key: :sender_id
  has_many :transactions_as_receiver, class_name: "Transaction", foreign_key: :receiver_id
  validates :account_number, presence: true, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :user, presence: true

  def set_default_balance
    if self.new_record?
      self.balance = 0.00 unless user.admin
    end
  end

  def new_account_number
    if self.new_record?
      self.account_number = "NL01RUBY#{10.times.map{rand(10)}.join}"
    end
  end

  def sufficient_balance?(amount)
    self.balance >= amount
  end
end
