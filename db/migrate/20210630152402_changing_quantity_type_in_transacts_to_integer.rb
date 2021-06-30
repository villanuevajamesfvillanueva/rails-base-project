class ChangingQuantityTypeInTransactsToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :transacts, :quantity, :integer
  end
end
