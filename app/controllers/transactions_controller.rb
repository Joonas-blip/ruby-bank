class TransactionsController < ApplicationController
  before_action :set_account
  before_action :authenticate_user

  def index
    @transactions = Transaction.where("sender_id = #{@account.id} OR receiver_id = #{@account.id}")
    # BankAccount.first.transactions
    @transaction = Transaction.new
  end

  def create
    unless @account.balance >= transaction_params['amount'].to_f
      redirect_to bank_account_transactions_path(@account)
      flash[:alert] = "Not enough balance"
    end
    new_transaction = Transaction.new(sender_id: @account.id, receiver_id: BankAccount.find_by(account_number: transaction_params['receiver']).id, amount: transaction_params['amount'].to_f)
    if new_transaction.valid?
      new_transaction.save
    else
      redirect_to bank_account_transactions_path(@account)
      flash[:alert] = "Something went wrong - please try again"
    end
  end

  def set_account
    @account = BankAccount.find(params[:bank_account_id])
  end

  def authenticate_user
    unless current_user == @account.user
      redirect_to(:bank_accounts)
      flash[:alert] = "Unauthorized access"
    end
  end

  def transaction_params
    params.require(:transaction).permit(:receiver, :amount)
  end

end
