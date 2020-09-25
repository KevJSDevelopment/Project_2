class Item < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    def self.search(search)
        if search 
            item = Item.where("category.includes? search")
        else 
            Item.all
        end
    end
end
