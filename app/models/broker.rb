class Broker < User
  has_many :broker_stocks, dependent: :destroy
  has_many :transacts, dependent: :nullify
  #   has_many :brokers_stocks, dependent: :destroy
end
