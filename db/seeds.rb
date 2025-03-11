# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

amber = User.create(first_name: 'Amber', last_name: 'Lee', email: 'amber@example.com', password: 'password')
more = User.create(first_name: 'More', last_name: 'Lee', email: 'more@example.com', password: 'password')


Equipment.create(name: 'tent', price: 40, user: amber)
Equipment.create(name: 'LED lights', price: 10, user: amber)
Equipment.create(name: 'Chicken', price: 5, user: more)
