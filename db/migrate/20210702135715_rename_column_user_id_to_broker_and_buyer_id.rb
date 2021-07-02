class RenameColumnUserIdToBrokerAndBuyerId < ActiveRecord::Migration[6.0]
  def change
    rename_column :buyer_stocks, :user_id, :buyer_id
    rename_column :broker_stocks, :user_id, :broker_id
  end
end
