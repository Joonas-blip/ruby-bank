class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :sending_account
      t.integer :receiving_account
      t.float :amount
      t.string :transaction_number

      t.timestamps
    end
  end
end
