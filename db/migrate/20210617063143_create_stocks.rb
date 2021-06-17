class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
        t.string :name
        t.float :price
        t.decimal :quantity
    
        t.timestamps
    end
  end
end
