class AddingBrokerIdColumnToBuyerStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :buyer_stocks, :broker_id, :integer
  end
end
