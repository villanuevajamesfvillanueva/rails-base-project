class BrokerStocksController < ApplicationController
  def index; end

  def create
    @broker_stock = BrokerStock.new(broker_stock_params)

    if @broker_stock.valid?
      @broker_stock.save
      redirect_to root_path, notice: 'Stock was added to the Portfolio.'
      # create transact instance
      @transact = Transact.new(broker_id: 'API', buyer_id: params[:id], stock_id: params[:stock_id], quantity: params[:quantity], price: params[:price])
      @transact.save
    else
      redirect_to root_path, alert: 'Unable to add'
    end
  end

  def update
    @broker_stock = BrokerStock.find(params[:id])
    redirect_to root_path, notice: 'Stock was updated successfully.' if @broker_stock.update(broker_stock_params)
  end

  def destroy
    @broker_stock = BrokerStock.find_by(stock_id: params[:id])
    @broker_stock.destroy
    redirect_to root_path, notice: 'Stock was removed from portfolio.'
  end

  def broker_stock_params
    params.require(:broker_stock).permit(:user_id, :stock_id, :companyname, :quantity, :price)
  end

  def transact_params
    params.require(:transact).permit(:broker_id, :buyer_id, :stock_id, :quantity, :price)
  end
end
