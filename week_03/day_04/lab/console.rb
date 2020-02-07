require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')
require('pry')


movie1=Movie.new({'title'=>'Jaws','genre'=>'horror','budget'=>'17000000'})
movie2=Movie.new({'title'=>'Duel','genre'=>'thriller','budget'=>'2500000'})
movie3=Movie.new({'title'=>'ET','genre'=>'family','budget'=>'14000000'})
movie4=Movie.new({'title'=>'Jaws 2','genre'=>'horror','budget'=>'34000000'})

star1=Star.new({'first_name' => 'Roy', 'last_name' => 'Schnieder'})
star2=Star.new({'first_name' => 'Dee', 'last_name' => 'Wallace'})
star3=Star.new({'first_name' => 'Drew', 'last_name' => 'Barrymore'})
star4=Star.new({'first_name' => 'Dennis', 'last_name' => 'Weaver'})


movie1.save
movie2.save
movie3.save
movie4.save

star1.save
star2.save
star3.save
star4.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '100000'})
casting2 = Casting.new({'movie_id' => movie4.id, 'star_id' => star1.id, 'fee' => '1000000'})
casting3 = Casting.new({'movie_id' => movie2.id, 'star_id' => star4.id, 'fee' => '50000'})
casting4 = Casting.new({'movie_id' => movie3.id, 'star_id' => star2.id, 'fee' => '500000'})
casting5 = Casting.new({'movie_id' => movie3.id, 'star_id' => star3.id, 'fee' => '250000'})

casting1.save
casting2.save
casting3.save
casting4.save
casting5.save




















binding.pry
nil
