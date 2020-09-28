class OrderItemsController < ApplicationController

    def add_or_create
        item = Item.find(params[:id])
        logged_in_id = session[:user_id]
        order = Order.find_or_create_by(status: "Pending", user_id: logged_in_id)
        OrderItem.create(item_id: item.id, order_id: order.id)
        redirect_to order_path(order.id)
    end

end
