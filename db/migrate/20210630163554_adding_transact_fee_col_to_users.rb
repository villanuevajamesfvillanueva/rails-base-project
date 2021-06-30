class AddingTransactFeeColToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :transact_fee, :decimal
  end
end
