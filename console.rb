require('pry')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/price')
require_relative('models/screening')
require_relative('models/ticket')


adult_price = Price.new({
  'category' => 'adult',
  'price' => 10
  })
adult_price.save

customer1 = Customer.new({
  'name' => 'customer1',
  'category_id' => adult_price.id
  })
customer1.save

film1 = Film.new({
  'title' => 'film1'
  })
film1.save

binding.pry
nil