require_relative( "../models/artists.rb" )
require_relative( "../models/categories.rb" )
require_relative( "../models/artworks.rb" )
require("pry-byebug")

Artist.delete_all()
Category.delete_all()
Artwork.delete_all()


artist1 = Artist.new({
  "first_name" => "Simon",
  "last_name" => "Bisley"
})

artist2 = Artist.new({
  "first_name" => "Chris",
  "last_name" => "Foss"
})

artist3 = Artist.new({
  "first_name" => "Frank",
  "last_name" => "Frazetta"
})

artist4 = Artist.new({
  "first_name" => "Jean",
  "last_name" => "Giraud(Moebius)"
})

artist5 = Artist.new({
  "first_name" => "Jim",
  "last_name" => "Burns"
})

artist1.save()
artist2.save()
artist3.save()
artist4.save()
artist5.save()

category1 = Category.new({
  "type" => "unassigned"
})

category2 = Category.new({
  "type" => "classic"
})

category1.save()
category2.save()


artwork1 = Artwork.new({
  "title" => "Venom",
  "details" => "Acrylic",
  "date_created" => "2018",
  "artist_id" => 1,
  "category_id" => 1
})

artwork2 = Artwork.new({
  "title" => "Judge Dredd",
  "details" => "Acrylic",
  "date_created" => "2006",
  "artist_id" => 1,
  "category_id" => 1
})

artwork3 = Artwork.new({
  "title" => "Dune",
  "details" => "Oils",
  "date_created" => "1975",
  "artist_id" => 2,
  "category_id" => 1
})

artwork4 = Artwork.new({
  "title" => "The Void",
  "details" => "Oils",
  "date_created" => "1970",
  "artist_id" => 2,
  "category_id" => 1
})

artwork5 = Artwork.new({
  "title" => "Princess of Mars",
  "details" => "Oils",
  "date_created" => "1975",
  "artist_id" => 3,
  "category_id" => 1
})

artwork6 = Artwork.new({
  "title" => "Death Dealer",
  "details" => "Oils",
  "date_created" => "2010",
  "artist_id" => 3,
  "category_id" => 1
})

artwork7 = Artwork.new({
  "title" => "The Face",
  "details" => "Ink & digital colour",
  "date_created" => "2001",
  "artist_id" => 4,
  "category_id" => 1
})

artwork8 = Artwork.new({
  "title" => "Arzach",
  "details" => "Digital",
  "date_created" => "1990",
  "artist_id" => 4,
  "category_id" => 1
})

artwork9 = Artwork.new({
  "title" => "Wanderers",
  "details" => "Digital",
  "date_created" => "2013",
  "artist_id" => 5,
  "category_id" => 1
})

artwork10 = Artwork.new({
  "title" => "The Illustrated Man",
  "details" => "Acrylic",
  "date_created" => "1980",
  "artist_id" => 5,
  "category_id" => 1
})



artwork1.save()
artwork2.save()
artwork3.save()
artwork4.save()
artwork5.save()
artwork6.save()
artwork7.save()
artwork8.save()
artwork9.save()
artwork10.save()

artwork11 = Artwork.new({
  "title" => "Slaine",
  "details" => "Acrylic",
  "date_created" => "1991",
  "artist_id" => 1,
  "category_id" => 1
})

artwork12 = Artwork.new({
  "title" => "King Conan",
  "details" => "Acrylic",
  "date_created" => "2016",
  "artist_id" => 1,
  "category_id" => 1
})

artwork13 = Artwork.new({
  "title" => "Machine in Shaft",
  "details" => "Oils",
  "date_created" => "1975",
  "artist_id" => 2,
  "category_id" => 1
})

artwork14 = Artwork.new({
  "title" => "Starship Rescue",
  "details" => "Oils",
  "date_created" => "1970",
  "artist_id" => 2,
  "category_id" => 1
})

artwork15 = Artwork.new({
  "title" => "Princess of Mars",
  "details" => "Oils",
  "artist_id" => 3,
  "category_id" => 1
})

artwork16 = Artwork.new({
  "title" => "Death Dealer",
  "details" => "Oils",
  "date_created" => "5/10/2010",
  "artist_id" => 3,
  "category_id" => 1
})

artwork17 = Artwork.new({
  "title" => "The Face",
  "details" => "Ink & digital colour",
  "date_created" => "13/4/2001",
  "artist_id" => 4,
  "category_id" => 2
})

artwork18 = Artwork.new({
  "title" => "Arzach",
  "details" => "Digital",
  "date_created" => "10/1/1990",
  "artist_id" => 4,
  "category_id" => 2
})

artwork19 = Artwork.new({
  "title" => "Wanderers",
  "details" => "Digital",
  "date_created" => "11/4/2013",
  "artist_id" => 5,
  "category_id" => 2
})

artwork20 = Artwork.new({
  "title" => "The Illustrated Man",
  "details" => "Acrylic",
  "date_created" => "1/10/1980",
  "artist_id" => 5,
  "category_id" => 2
})



artwork11.save()
artwork12.save()
artwork13.save()
artwork14.save()
artwork15.save()
artwork16.save()
artwork17.save()
artwork18.save()
artwork19.save()
artwork20.save()
