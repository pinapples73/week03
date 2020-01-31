require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( 'models/artists.rb' )
require_relative( 'models/artworks.rb' )

also_reload( 'models/*' )

get '/index' do
  @artworks = Artwork.show_all
  # p @artworks
  erb ( :artworks )
end

get '/admin' do
  @artworks = Artwork.show_all
  @artists = Artist.show_all
  erb ( :admin )
end


get '/artist/:id' do
  @result =  "#{Artist.find(params[:id]}"
  erb(:result)
end
