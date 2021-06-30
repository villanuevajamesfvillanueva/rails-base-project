class Broker < User
  has_many :broker_stocks, dependent: :nullify
  has_many :transacts, dependent: :destroy
  #   has_many :brokers_stocks, dependent: :destroy
end
