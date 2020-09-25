class OrderItemsController < ApplicationController

    def add_or_create
        item = Item.find(params[:id])
        user = User.find(6)
        order = Order.find_or_create_by(status: "Pending", user_id: user)
        OrderItem.create(item_id: item.id, order_id: order.id)
    end

end
