class Item < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    has_many :wishlist_items
    has_many :wishlists, through: :wishlist_items

    def self.search(search, category) 
        if category != "" && category != nil
            category_items = Item.where(category: category)
            if search != "" && search != nil
                items = category_items.where("name LIKE '%#{search}%'")
            else 
                category_items
            end
        else 
            if search != "" && search != nil
                items = Item.where("name LIKE '%#{search}%'")
            else 
                Item.all 
            end
        end
        
    end



    def self.all_categories
        Item.distinct.pluck(:category)
    end

end
