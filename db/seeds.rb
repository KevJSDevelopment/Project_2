# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.delete_all
Order.delete_all
Item.delete_all
OrderItem.delete_all

status = ["Pending", "Purchased"]
categories = ["food", "clothing", "furniture", "cosmetics", "hardware", "apps & games", "electronics", "baby", "garden", "pet supplies", "sports"]
orders = []
user = User.create(name: Faker::Name.unique.name)

(5).times do
    orders << Order.create(status: status[1], user_id: user.id)
end

(100).times do 
    item = Item.create(name: Faker::Commerce.product_name, price: Faker::Number.decimal(l_digits:2), category: categories.sample)
    OrderItem.create(item_id: item.id, order_id: orders.sample.id)
end

order = Order.create(status: status[0], user_id: user.id)
item = Item.create(name: Faker::Commerce.product_name, price: Faker::Number.decimal(l_digits:2), category: categories.sample)
OrderItem.create(item_id: item.id, order_id: order.id)

# (15).times do
