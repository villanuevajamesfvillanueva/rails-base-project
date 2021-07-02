class Buyer < User
  has_many :buyer_stocks, dependent: :destroy
  has_many :transacts, dependent: :nullify
  #   has_many :buyers_stocks, dependent: :destroy
end
