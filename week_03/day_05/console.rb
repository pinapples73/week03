# frozen_string_literal: true

require('pry')

require_relative('models/tickets')
require_relative('models/films')
require_relative('models/customers')
require_relative('models/screenings')

film1 = Film.new('title' => 'Star Wars', 'price' => '10')
film2 = Film.new('title' => 'Parasite', 'price' => '7')
film3 = Film.new('title' => 'Little Women', 'price' => '8')
film4 = Film.new('title' => 'Knives Out', 'price' => '9')

film1.save
film2.save
film3.save
film4.save

customer1 = Customer.new('name' => 'John Smith', 'funds' => '20')
customer2 = Customer.new('name' => 'Jessica Jones', 'funds' => '10')
customer3 = Customer.new('name' => 'Matt Bianco', 'funds' => '9')
customer4 = Customer.new('name' => 'Bernie Winters', 'funds' => '7')
customer5 = Customer.new('name' => 'Neil Young', 'funds' => '11')
customer6 = Customer.new('name' => 'David Bowie', 'funds' => '15')

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save
customer6.save

screening1 = Screening.new('film_time' => '14:20', 'tickets_left' => 5)
screening2 = Screening.new('film_time' => '16:30', 'tickets_left' => 5)
screening3 = Screening.new('film_time' => '17:00', 'tickets_left' => 5)

screening4 = Screening.new('film_time' => '09:30', 'tickets_left' => 5)
screening5 = Screening.new('film_time' => '12:30', 'tickets_left' => 5)
screening6 = Screening.new('film_time' => '16:00', 'tickets_left' => 5)

screening1.save
screening2.save
screening3.save
screening4.save
screening5.save
screening6.save

ticket1 = Ticket.new('customer_id' => customer6.c_id, 'film_id' => film2.f_id, 'screening_id' => screening2.s_id)
ticket2 = Ticket.new('customer_id' => customer5.c_id, 'film_id' => film2.f_id, 'screening_id' => screening5.s_id)
ticket3 = Ticket.new('customer_id' => customer4.c_id, 'film_id' => film1.f_id, 'screening_id' => screening6.s_id)
ticket4 = Ticket.new('customer_id' => customer3.c_id, 'film_id' => film4.f_id, 'screening_id' => screening1.s_id)
ticket5 = Ticket.new('customer_id' => customer2.c_id, 'film_id' => film3.f_id, 'screening_id' => screening3.s_id)
ticket6 = Ticket.new('customer_id' => customer1.c_id, 'film_id' => film4.f_id, 'screening_id' => screening4.s_id)

ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save

binding.pry
nil
