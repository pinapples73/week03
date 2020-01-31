require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('./models/pizza_order')
also_reload('./models/*')


# this controller will return some html that shows all pizza orders
get '/pizza-orders' do
  # first get all pizza orders
  #then pass teh pizza orders into a global variable
  @orders = PizzaOrder.all()
  #render the index route html
  erb(:index)
end

# this route shoould return a html page that has a form
# to create new pizza orders
get '/pizza-orders/new' do
  erb(:new)
end

# this route should return some html that shows one pizza ordewr
get '/pizza-orders/:id' do
  #first grab the order id form the url
  # get pizza order - by calling find on PizzaOrder
  order_id = params[:id]
  # and by opassing in the id weve got form params
  @order = PizzaOrder.find(order_id)
  # render the show page for that order
  erb(:show)
end

post '/pizza-orders' do
  #this post should accept post requests on pizza Orders
  # then take the post parameters
  # then create a new pizza orders
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:created)
end


post '/pizza-orders/:id/delete' do
  #this post should take a pizza order id and then remove that from
  # teh database
  order_id = params[:id]
  @order = PizzaOrder.delete(order_id)
  redirect '/pizza-orders'
end

get '/pizza-orders/:id/edit' do
  order_id = params[:id]
  @order = PizzaOrder.find(order_id)
  erb(:edit)
end

post '/pizza-orders/:id' do
  order_to_edit = PizzaOrder.new(params)
  order_to_edit.update()
  redirect '/pizza-orders'
end
