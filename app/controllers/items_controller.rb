class ItemsController < ApplicationController

  def index
    @items = Item.search(params[:search], params[:category])
    if params[:category] != nil && params[:category] != ""
      @categories = Category.where(id: params[:category])
    else
      @categories = Category.all
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
end
