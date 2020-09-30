class WishlistItemsController < ApplicationController

    def add_to_wishlist 
      item = Item.find(params[:id])
      wishlist = Wishlist.find(params[:wishlist])
      WishlistItem.create(item_id: item.id, wishlist_id: wishlist.id)
      redirect_to wishlist_path(wishlist.id)
    end

    def remove_item
      item = Item.find(params[:id])
      order = Order.find_by(status: "Pending")
      order_item = OrderItem.find_by(item_id: item.id, order_id: order.id)
      order_item.destroy
      redirect_to order_path(order.id)
  end
end
