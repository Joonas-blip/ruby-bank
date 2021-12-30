class BankAccountsController < ApplicationController

  def index
    @current_user = current_user
    @bank_accounts = @current_user.bank_accounts
  end

end
