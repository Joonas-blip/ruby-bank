class TransactionsController < ApplicationController
  before_action :authenticate_user

  def index
    @account = BankAccount.find(params[:bank_account_id])
    @transactions = Transaction.where("sending_account = #{@account.id} OR receiving_account = #{@account.id}")
    # BankAccount.first.transactions
    @transaction = Transaction.new
  end

  def create
    unless current_account.balance >= transaction_params['amount'].to_f
      flash.now[:alert] = "No balance"
    end

  end

  def current_account
    BankAccount.find(params[:bank_account_id])
  end

  def authenticate_user
    unless current_user == BankAccount.find(params[:bank_account_id]).user
      redirect_to(:bank_accounts)
      flash[:alert] = "Unauthorized access"
    end
  end

  def transaction_params
    params.require(:transaction).permit(:receiving_account, :amount)
  end

end
