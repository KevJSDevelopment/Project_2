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

    if @items == []
      flash.now[:message] = "No items found. Please search again"
      @nothing_searched = true 
    else 
      @nothing_searched = false
    end
    render :index
  end

  def show 
    @item = Item.find(params[:id])
    if session[:user_id]
      @wishlists = Wishlist.where(user_id: session[:user_id])
    end
  end
  
end
