class TransactsController < ApplicationController
  #   before_action :authenticate_user!
  #   def index
  #     if buyer_signed_in?
  #       @transactions = current_buyer.transacts
  #     elsif broker_signed_in?
  #       @broker_transactions = current_broker.broker_stocks.map(&:transacts)
  #     end
  #   end

  def transact_params
    params.require(:transact).permit(:broker_id, :buyer_id, :stock_id, :quantity, :price, :broker_email, :buyer_email)
  end

  def show_buyer_transact
    @transacts = Transact.where(buyer_id: params[:id])
  end

  def show_broker_transact
    @transacts = Transact.where(broker_id: params[:id])
  end

  def show_admin_transact
    @transacts = Transact.all
  end
end
