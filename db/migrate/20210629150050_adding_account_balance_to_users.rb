class AddingAccountBalanceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :balance, :decimal
  end
end
