class Transact < ApplicationRecord
  belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id, inverse_of: false
  belongs_to :broker, class_name: 'User', foreign_key: :broker_id, inverse_of: false
  has_many :stock, class_name: 'Stock', foreign_key: :stock_id, inverse_of: false

  validates :stock_id, presence: true
#   validates :quantity, presence: true
  validates :price, presence: true
end
