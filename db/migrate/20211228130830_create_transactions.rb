class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :sending_account, null: false, foreign_key: true
      t.references :receiving_account, null: false, foreign_key: true
      t.float :amount
      t.string :transaction_number
    end
  end
end
