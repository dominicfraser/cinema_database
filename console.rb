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

screening1 = Screening.new({
  'show_date' => '2017-07-14',
  'film_id' => film1.id,
  'amount_tickets' => 10
  })
screening1.save

ticket1 = Ticket.new({
  'film_id' => film1.id,
  'screening_id' => screening1.id,
  'customer_id' => customer1.id,
  'price_id' => adult_price.id
  })
ticket1.save



binding.pry
nil