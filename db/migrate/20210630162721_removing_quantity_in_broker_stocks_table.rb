class RemovingQuantityInBrokerStocksTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :broker_stocks, :quantity, :integer
  end
end
