class Buyer < User
  has_many :buyer_stocks, dependent: :nullify
  #   has_many :buyers_stocks, dependent: :destroy
end
