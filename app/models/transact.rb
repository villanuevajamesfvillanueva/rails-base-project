class Transact < ApplicationRecord
  belongs_to :buyer
  belongs_to :broker_stock

  validates :stock_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
