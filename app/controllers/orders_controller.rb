class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: session[:user_id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def purchase
    @order = Order.find_by(status: "Pending")
    @order.update(status: "Purchased") 
    redirect_to order_path(@order.id)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  # def add_or_create
  #   ##customized create
  #   # byebug
  #   # @user = User.find(params[:id])
    
  # end

end
