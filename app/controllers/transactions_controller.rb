class TransactionsController < ApplicationController

  def index
    @account = BankAccount.find(params[:bank_account_id])
    @transactions = Transaction.where("sending_account = #{@account} || receiving_account = #{@account}")
    # BankAccount.first.transactions
  end

end
