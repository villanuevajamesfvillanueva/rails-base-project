class BuyerStocksController < ApplicationController
  def index; end

  def create
    @buyer_stock = BuyerStock.new(buyer_stock_params)

    if @buyer_stock.valid?
      @buyer_stock.save
      redirect_to root_path, notice: 'Stock was added to the Portfolio.'
      # create transact instance
      @transact = current_buyer.transacts.build(broker_id: params[:buyer_stock][:broker_id], stock_id: params[:buyer_stock][:stock_id], quantity: params[:buyer_stock][:quantity], price: params[:buyer_stock][:price])
      @transact.save
      # update balance
      @balance = params[:buyer_stock][:quantity].to_f * params[:buyer_stock][:price].to_f
      current_buyer.balance -= @balance
      current_buyer.save
    else
      redirect_to root_path, alert: @buyer_stock.errors.messages.to_s
    end
  end

  def update
    @buyer_stock = BuyerStock.find(params[:id])
    redirect_to root_path, notice: 'Stock was updated successfully.' if @buyer_stock.update(buyer_stock_params)
  end

  def destroy
    # create transact instance
    @stock = BuyerStock.find_by(user_id: current_user.id, stock_id: params[:id])
    @transact = current_buyer.transacts.build(broker_id: current_user.id, buyer_id: nil, stock_id: params[:id], quantity: @stock.quantity, price: @stock.price)
    @transact.save

    @buyer_stock = BuyerStock.find_by(stock_id: params[:id])
    @buyer_stock.destroy
    redirect_to root_path, notice: 'Stock was removed from portfolio.'

    # update balance
    current_buyer.balance += @buyer_stock.quantity * @buyer_stock.price
    current_buyer.save
  end

  def buyer_stock_params
    params.require(:buyer_stock).permit(:user_id, :stock_id, :companyname, :quantity, :price, :broker_id)
  end
end
