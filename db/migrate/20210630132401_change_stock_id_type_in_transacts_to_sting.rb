class ChangeStockIdTypeInTransactsToSting < ActiveRecord::Migration[6.0]
  def change
    change_column :transacts, :stock_id, :string
  end
end
