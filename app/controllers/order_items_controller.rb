class OrderItemsController < ApplicationController

    def add_or_create
        item = Item.find(params[:id])
        user = User.all[0]
        order = Order.find_or_create_by(status: "Pending", user_id: user.id)
        OrderItem.create(item_id: item.id, order_id: order.id)
        redirect_to order_path(order.id)
    end

end
