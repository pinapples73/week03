# frozen_string_literal: true

require 'sinatra'

# Sinatra allows us to  build a controller
# a controller has one or more routes

# this is a route which allows an HTTP GET on /hi
get '/hi' do
  'Hello, World!'
end

get '/roll-die' do
  rand(1..6).to_s
end
# this GET route should le me give a number in the
# route and geta  friend from TV show back
get '/friends/:number' do
  friends = ["Joey", "Pheobe", "Monica", "Chandler", "Rachel", "Ross"]
  index = params["number"].to_i - 1
  return friends[index]
end
# 
# get '/pet/:hello' do
#   "hello pet "
# end

get '/pet/:name' do
  "hello #{params[:name]}"
end
