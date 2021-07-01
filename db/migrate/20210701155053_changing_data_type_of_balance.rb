class ChangingDataTypeOfBalance < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :balance, :decimal, :precision => 12, :scale => 2
  end
end
