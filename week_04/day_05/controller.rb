require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( 'models/artists.rb' )
require_relative( 'models/artworks.rb' )

also_reload( 'models/*' )

get '/index' do
  @artworks = Artwork.show_all
  @artists = Artist.show_all
  erb ( :artworks )
end

get '/admin' do
  @artworks = Artwork.show_all
  @artists = Artist.show_all
  erb ( :admin )
end

get '/artist/add' do
  erb(:new_artist_form)
end

post '/artist/add' do
  @new_artist = Artist.new(params)
  @new_artist.save
  redirect '/admin'
end

post '/artist/:id/delete' do
  artist_id = params[:id]
  # Artwork.delete_by_artist(artist_id)
  Artist.delete(artist_id)
  redirect '/admin'
end

post '/artwork/:id/delete' do
  artwork_id = params[:id]
  Artwork.delete(artwork_id)
  redirect '/admin'
end
