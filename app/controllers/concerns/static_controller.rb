class StaticController < ApplicationController

  def greetings
    @bestdeals = Item.all.min_by(10) {|item| item.price}
    @items_rec = []
    (10).times do 
      @items_rec << Item.all.sample
    end
    render :greetings
  end

  def goodbye
  end

  def about
  end

  def contact
  end


end