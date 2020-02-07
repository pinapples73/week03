require('pry-byebug')
require_relative('models/property.rb')

Property.delete_all()

property1 = Property.new(
  {
    'address' => '1234 Rainbow Lane',
    'value' => '123000',
    'bedrooms' => '3',
    'year_built' => '1234'
  }
)

  property2 = Property.new(
    {
      'address' => '5 Elm Street',
      'value' => '10000',
      'bedrooms' => '4',
      'year_built' => '1666'
  }
)

property2.save()
property1.save()

property1.value = 10000
property1.update()

rainbow_address = Property.find_by_address(property1.address)

elm_id = Property.find(property2.id)



binding.pry

nil
