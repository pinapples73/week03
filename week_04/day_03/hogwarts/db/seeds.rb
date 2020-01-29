require('pry')
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()



gd = House.new(
  {
    'house_name' => 'gryffindor',
    'logo_url' => 'https://1.bp.blogspot.com/-WV_sb7UjMIo/V_ENTue9HCI/AAAAAAABCrA/XocZ5xwp9mo7DSoaB-qXU_AxLKC7e2DbgCEw/s1600/gryffindor.jpg'
  }
)
gd.save


rvc = House.new(
  {
    'house_name' => 'ravenclaw',
    'logo_url' => 'https://4.bp.blogspot.com/-FfxqfrKt9UA/V_ENUpNkHuI/AAAAAAABCrE/a16s6N7zEBIsWl8-QAw5oQk9AMMcYFr2gCEw/s1600/ravenclaw.jpg'
  }
)
rvc.save


hfp = House.new(
  {
    'house_name' => 'hufflepuff',
    'logo_url' => 'https://2.bp.blogspot.com/-UcA_FGXVBHQ/V_EN4vkmPFI/AAAAAAABCrM/LjhvcqfOo841_NmuelBqFW40dz7zxG9QQCLcB/s1600/hufflepuff.jpg'
  }
)
hfp.save


sly = House.new(
  {
    'house_name' => 'slytherin',
    'logo_url' => 'https://1.bp.blogspot.com/-nQCYFpQIJQQ/V_ENVM7G_ZI/AAAAAAABCrI/5FfjP0hh6skEKKbGP5yhd17gqrkeYymUQCEw/s1600/slytherin.jpg'
  }
)
sly.save



harry = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'age' => 11,
  'house_id' => gd.id
  });

harry.save()

hermione = Student.new({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'age' => 10,
  'house_id' => gd.id
  });
hermione.save()

draco = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'age' => 13,
  'house_id' => sly.id
  });

draco.save()

# binding.pry
# nil
