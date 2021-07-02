class AddingEmailColsToTransactsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :transacts, :broker_email, :string
    add_column :transacts, :buyer_email, :string
  end
end
