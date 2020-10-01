class WishlistItemsController < ApplicationController

    def add_to_wishlist 
      item = Item.find(params[:id])
      wishlist = Wishlist.find(params[:wishlist])
      WishlistItem.create(item_id: item.id, wishlist_id: wishlist.id)
      redirect_to wishlist_path(wishlist.id)
    end

    def remove_item
      item = Item.find(params[:item])
      wishlist = Wishlist.find(params[:id])
      wishlist_item = WishlistItem.find_by(item_id: item.id, wishlist_id: wishlist.id)
      wishlist_item.destroy
      redirect_to wishlist_path(wishlist.id)
  end
end
