class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bank_accounts
  has_many :transactions, through: :bank_accounts
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
end
