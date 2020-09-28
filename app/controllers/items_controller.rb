class ItemsController < ApplicationController

  def index
    @items = Item.search(params[:search], params[:category])
    @categories = []
    @items.each do |item|
      if !@categories.include?(item.category)
          @categories << item.category
      end
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
end
