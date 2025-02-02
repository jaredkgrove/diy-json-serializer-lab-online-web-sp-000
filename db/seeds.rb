# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
desc = "Here is my unnecessarily long description of the "
10.times do
  products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
  product_name = products.sample
  Product.create(:name => product_name, :price => Faker::Number.between(1,1500), description: desc + product_name, :inventory => Faker::Number.between(0,4))
end
5.times do
  Customer.create(:name => Faker::Name.name)
end

5.times do
  Invoice.create
end
10.times do
  order = Order.create(:customer_id => Customer.all.collect(&:id).sample, :invoice_id => Invoice.all.collect(&:id).sample)
  order.products << Product.find(Product.all.collect(&:id).sample)
end

