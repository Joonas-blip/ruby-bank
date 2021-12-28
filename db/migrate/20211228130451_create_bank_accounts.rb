class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.float :balance
      t.string :account_number
    end
  end
end
