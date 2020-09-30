class OrderItemsController < ApplicationController

    def add_or_create
        if session[:user_id]
            item = Item.find(params[:id])
            logged_in_id = session[:user_id]
            order = Order.find_or_create_by(status: "Pending", user_id: logged_in_id)
            OrderItem.create(item_id: item.id, order_id: order.id)
            redirect_to order_path(order.id)
        else
            flash[:message] = "You must be logged in to add an item to your order"
            redirect_to login_path
        end
    end

    def remove_item
        item = Item.find(params[:id])
        order = Order.find_by(status: "Pending")
        order_item = OrderItem.find_by(item_id: item.id, order_id: order.id)
        order_item.destroy
        redirect_to order_path(order.id)
    end
end
