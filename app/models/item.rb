class Item < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    has_many :wishlist_items
    has_many :wishlists, through: :wishlist_items

    def self.search(search)
        if search 
            items = Item.where("name LIKE '%#{search}%'")
        else 
            Item.all
        end
    end
end
