class BrokerStocksController < ApplicationController
  def index; end

  def create
    @broker_stock = BrokerStock.new(broker_stock_params)

    if @broker_stock.valid?
      @broker_stock.save
      redirect_to root_path, notice: 'Stock was added to the Portfolio.'
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
    params.require(:broker_stock).permit(:broker_id, :stock_id, :companyname, :price)
  end

  def transact_params
    params.require(:transact).permit(:broker_id, :buyer_id, :stock_id, :quantity, :price)
  end
end
