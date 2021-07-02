class BrokerStock < ApplicationRecord
  belongs_to :broker, foreign_key: :broker_id, inverse_of: false
  #   validates :companyname, presence: true
  #   validates :quantity, presence: true
  #   validates :price, presence: true
end
