require ('sinatra')
require ('sinatra/contrib/all')

require_relative('./models/calculator')
also_reload('./models/*')


get '/add/:num1/:num2' do
  @calculation =  "#{Calculator.add(params[:num1].to_i, params[:num2].to_i)}"
  erb(:result)
end

get '/subtract/:num1/:num2' do
  @calculation = "#{Calculator.subtract(params[:num1].to_i, params[:num2].to_i)}"
  erb(:result)
end

get '/multiply/:num1/:num2' do
  @calculation = "#{Calculator.multiply(params[:num1].to_i, params[:num2].to_i)}"
  erb(:result)
end

get '/divide/:num1/:num2' do
  @calculation = "#{Calculator.divide(params[:num1].to_f, params[:num2].to_f)}"
  erb(:result)
end

get '/' do
  erb(:home)
end

get '/about_us' do
  erb(:about_us)
end
