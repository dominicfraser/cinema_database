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
customer2 = Customer.new({
  'name' => 'customer2',
  'category_id' => adult_price.id
  })
customer1.save
customer2.save

film1 = Film.new({
  'title' => 'film1'
  })
film2 = Film.new({
  'title' => 'film2'
  })
film1.save
film2.save

screening1 = Screening.new({
  'show_date' => '2017-07-14',
  'film_id' => film1.id,
  'amount_tickets' => 10
  })
screening2 = Screening.new({
  'show_date' => '2017-07-15',
  'film_id' => film1.id,
  'amount_tickets' => 10
  })
screening3 = Screening.new({
  'show_date' => '2017-07-16',
  'film_id' => film1.id,
  'amount_tickets' => 10
  })
screening1.save
screening2.save
screening3.save

ticket1 = Ticket.new({
  'film_id' => film1.id,
  'screening_id' => screening1.id,
  'customer_id' => customer1.id,
  'price_id' => adult_price.id
  })
ticket2 = Ticket.new({
  'film_id' => film1.id,
  'screening_id' => screening1.id,
  'customer_id' => customer2.id,
  'price_id' => adult_price.id
  })
ticket3= Ticket.new({
  'film_id' => film1.id,
  'screening_id' => screening2.id,
  'customer_id' => customer1.id,
  'price_id' => adult_price.id
  })
ticket4 = Ticket.new({
  'film_id' => film1.id,
  'screening_id' => screening3.id,
  'customer_id' => customer1.id,
  'price_id' => adult_price.id
  })
ticket5 = Ticket.new({
  'film_id' => film2.id,
  'screening_id' => screening3.id,
  'customer_id' => customer1.id,
  'price_id' => adult_price.id
  })
ticket6 = Ticket.new({
  'film_id' => film1.id,
  'screening_id' => screening3.id,
  'customer_id' => customer2.id,
  'price_id' => adult_price.id
  })
ticket7 = Ticket.new({
  'film_id' => film1.id,
  'screening_id' => screening3.id,
  'customer_id' => customer2.id,
  'price_id' => adult_price.id
  })
ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save
ticket7.save

binding.pry
film1.customers('2017-07-14')


nil