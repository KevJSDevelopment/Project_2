class Order < ApplicationRecord
    has_many :order_items
    has_many :items, through: :order_items
    belongs_to :user

    def total_price
        sum = 0
        self.items.each do |item|
            sum += item.price
        end
        sum
    end

    def item_quantity
        hash = {}
        current_order = Order.find_by(status: "Pending")
        current_order.items.each do |item| 
            if hash[item.name] == nil
                hash[item.name] = 1
            else
                hash[item.name] += 1
            end
        end
        hash
    end
end
