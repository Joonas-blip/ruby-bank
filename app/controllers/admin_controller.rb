class AdminController < ApplicationController
  before_action :authenticate_user

  def index
    @current_user = current_user
    @bank_accounts = BankAccount.all
    @transactions = Transaction.all
    @transaction = Transaction.new
  end

  def deposit
    if BankAccount.exists?(account_number: transaction_params['receiver'])
      new_transaction = Transaction.new(sender_id: @current_user.id, receiver_id: BankAccount.find_by(account_number: transaction_params['receiver']).id, amount: transaction_params['amount'].to_f, transaction_type: 'deposit')
      new_transaction.valid? ? new_transaction.save : error('other')
    else
      error('nonexistent')
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:receiver, :amount, :type)
  end

  def error(reason)
    if reason == 'nonexistent'
      redirect_to admin_path
      flash[:alert] = "Bank account does not exist"
    else
      redirect_to bank_account_transactions_path(@account)
      flash[:alert] = "Something went wrong - please try again"
    end
  end

  def authenticate_user
    unless current_user.admin
      redirect_to(:bank_accounts)
      flash[:alert] = "Unauthorized access"
    end
  end
end
