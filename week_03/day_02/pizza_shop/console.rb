require('pry-byebug')
require_relative('models/pizza_order.rb')

PizzaOrder.delete_all()


order1 = PizzaOrder.new(
  {'first_name' => 'Luke',
  'last_name' => 'Skywalker',
  'quantity' => '1',
  'topping' => 'Spicy meat feast'}
)

order2 = PizzaOrder.new(
  {'first_name' => 'Darth',
  'last_name' => 'Vader',
  'quantity' => '1',
  'topping' => 'Blood of the innocent'}
)

order1.save()
order2.save()

order2.quantity = 20
order2.update()

binding.pry
nil
