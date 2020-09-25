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
end
