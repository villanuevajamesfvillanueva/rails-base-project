class TransactsController < ApplicationController
  before_action :authenticate_user!
  def index
    if buyer_signed_in?
      @transactions = current_buyer.transacts
    elsif broker_signed_in?
      @broker_transactions = current_broker.broker_stocks.map(&:transacts)
    end
  end
end
