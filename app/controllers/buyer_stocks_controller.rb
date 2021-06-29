class BuyerStocksController < ApplicationController
  def index; end

  def create
    @buyer_stock = BuyerStock.new(buyer_stock_params)

    if @buyer_stock.valid?
      @buyer_stock.save
      redirect_to root_path, notice: 'Stock was added to the Portfolio.'
    else
      redirect_to root_path, alert: @buyer_stock.errors.messages.to_s
    end
  end

  def update
    @buyer_stock = BuyerStock.find(params[:id])
    redirect_to root_path, notice: 'Stock was updated successfully.' if @buyer_stock.update(buyer_stock_params)
  end

  def destroy
    @buyer_stock = BuyerStock.where(params[:id])
    @buyer_stock.destroy
    redirect_to root_path, notice: 'Stock was removed from portfolio.'
  end

  def buyer_stock_params
    params.require(:buyer_stock).permit(:user_id, :stock_id, :companyname, :quantity, :price)
  end
end
