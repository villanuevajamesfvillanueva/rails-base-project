class BuyerStock < ApplicationRecord
  belongs_to :buyer, inverse_of: false
  #   validates :companyname, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
