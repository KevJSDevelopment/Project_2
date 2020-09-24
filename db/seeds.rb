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
(5).times do
    user = User.create(name: Faker::Name.unique.name)
    # Order.create(status: status.sample, user_id: user.id)
end

# (15).times do
