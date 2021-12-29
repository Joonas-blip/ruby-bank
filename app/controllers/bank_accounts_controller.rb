class BankAccountsController < ApplicationController

  def index
    @bank_accounts = current_user.bank_accounts
  end

end
