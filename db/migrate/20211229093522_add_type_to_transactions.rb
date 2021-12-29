class AddTypeToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :transaction_type, :string, default: "transfer"
  end
end
