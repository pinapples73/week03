require('pry')
require_relative('models/album')
require_relative('models/artist')


artist1 = Artist.new({'artist_name' => 'The Beatles'})
artist1.save()

album1 = Album.new({'title' => 'Revolver', 'genre' => 'Pop/Rock', 'artist_id' => artist1.id })
album2 = Album.new({'title' => 'Rubber Soul', 'genre' => 'Pop/Rock', 'artist_id' => artist1.id })
album3 = Album.new({'title' => 'Sgt Peppers Lonely Hearts Club Band', 'genre' => 'Pop Rock', 'artist_id' => artist1.id })

album1.save()
album2.save()
album3.save()


binding.pry
nil
