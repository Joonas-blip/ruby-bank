class AddRefsToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :bank_accounts, column: :sender_id
    add_foreign_key :transactions, :bank_accounts, column: :receiver_id
  end
end
