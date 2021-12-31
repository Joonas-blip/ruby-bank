class BankAccountsController < ApplicationController

  def index
    @current_user = current_user
    @bank_accounts = @current_user.bank_accounts
    @new_account = BankAccount.new
  end

  def create
    account = BankAccount.new(user: current_user)
    account.save
    redirect_to bank_accounts_path
  end
end
