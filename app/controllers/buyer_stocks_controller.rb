class BuyerStocksController < ApplicationController
  def index; end

  def create
    @cost = params[:buyer_stock][:quantity].to_f * params[:buyer_stock][:price].to_f
    # check if stock already exists in portfolio

    if not_added?(current_buyer.id, params[:buyer_stock][:stock_id])
      @buyer_stock = BuyerStock.new(buyer_stock_params)
      # update balance
      if current_buyer.balance >= @cost
        current_buyer.balance -= @cost
        current_buyer.save
        @buyer_stock.save

        # create transact instance
        @broker_email = User.find(params[:buyer_stock][:broker_id]).email
      @buyer_email = User.find(current_buyer.id).email
        @transact = current_buyer.transacts.build(broker_id: params[:buyer_stock][:broker_id], stock_id: params[:buyer_stock][:stock_id], quantity: params[:buyer_stock][:quantity], price: params[:buyer_stock][:price], broker_email: @broker_email, buyer_email: @buyer_email)
        @transact.save
        redirect_to root_path, notice: 'Stock was added to the Portfolio.'

      else
        redirect_to root_path, alert: 'Insufficient balance'
      end

    elsif current_buyer.balance >= @cost
      # update balance and buyer_stock
      current_buyer.balance -= @cost
      current_buyer.save

      # update buyer_stock
      @existing_stock = BuyerStock.find_by(buyer_id: current_buyer.id, stock_id: params[:buyer_stock][:stock_id])
      @existing_stock.quantity += params[:buyer_stock][:quantity].to_i
      @existing_stock.save

      # create transact instance
      @broker_email = User.find(params[:buyer_stock][:broker_id]).email
      @buyer_email = User.find(current_buyer.id).email
      @transact = current_buyer.transacts.build(broker_id: params[:buyer_stock][:broker_id], stock_id: params[:buyer_stock][:stock_id], quantity: params[:buyer_stock][:quantity], price: params[:buyer_stock][:price], broker_email: @broker_email, buyer_email: @buyer_email)
      @transact.save

      redirect_to root_path, notice: 'Stock was added to the Portfolio.'

    end
    # redirect_to root_path, alert: @buyer_stock.errors.messages.to_s
  end

  def update
    @buyer_stock = BuyerStock.find(params[:id])
    redirect_to root_path, notice: 'Stock was updated successfully.' if @buyer_stock.update(buyer_stock_params)
  end

  def destroy
    # currently, destroying buyer stock means selling the stock so buyer account receives an amount of quantity*price

    # create transact instance
    @stock = BuyerStock.find_by(buyer_id: current_user.id, stock_id: params[:id])
    @broker_email = User.find(params[:buyer_stock][:broker_id]).email
    @buyer_email = User.find(current_buyer.id).email
    @transact = current_buyer.transacts.build(broker_id: current_user.id, buyer_id: nil, stock_id: params[:id], quantity: @stock.quantity, price: @stock.price, broker_email: @broker_email, buyer_email: @buyer_email)
    @transact.save

    @buyer_stock = BuyerStock.find_by(stock_id: params[:id])
    @buyer_stock.destroy
    redirect_to root_path, notice: 'Stock was removed from portfolio.'

    # update balance
    current_buyer.balance += @buyer_stock.quantity * @buyer_stock.price
    current_buyer.save
  end

  private

  def buyer_stock_params
    params.require(:buyer_stock).permit(:buyer_id, :stock_id, :companyname, :quantity, :price, :broker_id)
  end

  def not_added?(buyer_id, stock_id)
    res = BuyerStock.find_by(buyer_id: buyer_id, stock_id: stock_id)
    res.nil?
  end
end
