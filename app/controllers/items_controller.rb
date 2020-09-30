class ItemsController < ApplicationController

  def index
    if params[:category] != nil && params[:category] != ""
      @one_category = true
      @categories = Category.where(id: params[:category])
      @items = Item.search(params[:search], @categories[0])
    else
      @one_category = false
      @categories = Category.all
      @items = Item.search(params[:search], params[:category])
    end
    render :index
  end

  def show
    @item = Item.find(params[:id])
  end
  
end
