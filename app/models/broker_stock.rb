class BrokerStock < ApplicationRecord
  belongs_to :broker, inverse_of: false
  #   validates :companyname, presence: true
  #   validates :quantity, presence: true
  #   validates :price, presence: true
end
