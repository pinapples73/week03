require ('sinatra')
require ('sinatra/contrib/all')

require_relative('./models/game')
also_reload('./models/*')


get '/:player1/:player2' do
  @result =  "#{Game.play_game(params[:player1], params[:player2])}"
  erb(:result)
end

get '/' do
  erb(:welcome)
end
