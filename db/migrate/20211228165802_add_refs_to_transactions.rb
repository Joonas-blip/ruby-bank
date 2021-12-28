class AddRefsToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :bank_accounts, column: :sending_account
    add_foreign_key :transactions, :bank_accounts, column: :receiving_account
  end
end
