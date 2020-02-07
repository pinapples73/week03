require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative( 'models/artists.rb' )
require_relative( 'models/categories.rb' )
require_relative( 'models/artworks.rb' )


also_reload( 'models/*' )

# set up route to home page
get '/index' do

  @featured_artist = Artwork.select_featured_artist()
  @artists = Artist.show_all
  p "result = #{@featured_artist.id}"
  # @artists = Artist.show_all
  erb ( :home )
end

get '/artwork/all' do
  @categories = Category.show_all
  @artworks = Artwork.show_all
  @artists = Artist.show_all
  erb ( :artworks )
end

# set up route to admin page for managers
get '/admin' do
  @artworks = Artwork.show_all
  @artists = Artist.show_all
  @categories = Category.show_all
  erb ( :admin )
end

# set up route to add new artists form
get '/artist/add' do
  erb(:new_artist_form)
end

# set up route to add new artists to database
post '/artist/add' do
  @new_artist = Artist.new(params)
  @new_artist.save
  redirect '/admin'
end

get '/artwork/find' do
  id = params[:artist_id]
  @artworks = Artwork.find_by_artist(id)
  @artists = Artist.show_all
  @categories = Category.show_all
  erb(:artworks)
end

get '/artwork/category' do
  id = params[:category_id]
  @artworks = Artwork.find_by_category(id)
  @artists = Artist.show_all
  @categories = Category.show_all
  erb(:artworks)
end


# set up route to delete artists form database
post '/artist/:id/delete' do
  artist_id = params[:id]
  Artist.delete(artist_id)
  redirect '/admin'
end

# set up route to add new artwork form
get '/artwork/add' do
  @artists = Artist.show_all
  @categories = Category.show_all
  erb(:new_artwork_form)
end

# set up route to add new artwork to database
post '/artwork/add' do
  @new_artwork = Artwork.new(params)
  @new_artwork.save
  redirect '/admin'
end

# set up route to delete artwork form database
post '/artwork/:id/delete' do
  artwork_id = params[:id]
  Artwork.delete(artwork_id)
  redirect '/admin'
end

get '/artwork/:id/edit' do
  artwork_id = params[:id]
  @artists = Artist.show_all
  @categories = Category.show_all
  @artwork = Artwork.find(artwork_id)
  # binding.pry
  erb(:edit_artwork_form)
end

post '/artwork/:id/update' do
  Artwork.new(params).update
  redirect '/admin'
end

get '/artwork/:id/display' do
  artwork_id = params[:id]
  @artwork = Artwork.find(artwork_id)
  @artists = Artist.show_all
  @categories = Category.show_all
  erb(:display_art)
end

post '/category/add' do
  new_category = Category.new(params)
  new_category.save()
  redirect to '/artwork/add'
end

# binding.pry
# nil
