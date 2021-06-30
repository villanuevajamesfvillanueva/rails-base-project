class Transact < ApplicationRecord
  belongs_to :buyer, class_name: 'User', inverse_of: false
  belongs_to :broker, class_name: 'User', inverse_of: false
  has_many :stock, class_name: 'Stock', foreign_key: :stock_id, dependent: :nullify, inverse_of: false

  validates :stock_id, presence: true
  #   validates :quantity, presence: true
  validates :price, presence: true
end
