class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: 10)
  end

  def show
    @order = Order.find(params[:id])
  end

  # def add_or_create
  #   ##customized create
  #   # byebug
  #   # @user = User.find(params[:id])
    
  # end

end
