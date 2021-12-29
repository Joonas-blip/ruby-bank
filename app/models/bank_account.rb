class BankAccount < ApplicationRecord
  before_validation :set_default_balance, :new_account_number
  belongs_to :user
  has_many :transactions
  validates :account_number, presence: true, uniqieness: true
  validates :user, presence: true

  def set_default_balance
    if self.new_record?
      self.balance = 0.00
    end
  end

  def new_account_number
    if self.new_record?
      self.account_number = "NL01RUBY#{10.times.map{rand(10)}.join}"
    end
  end
end
