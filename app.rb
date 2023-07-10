# /dice.rb

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

rps = ["rock", "paper", "scissors"]

get("/") do
  @result = rps[0]
  erb(:rules)
end

get("/rock") do
  @player_message = "We played rock!"
  opponent_id = rand(0..2)
  opponent = rps[opponent_id]
  @opponent_message = "They played " + opponent + "!"
  if opponent == rps[0]
    @result_message = "We tied!"
  elsif opponent == rps[1]
    @result_message = "We lost!"
  elsif opponent == rps[2]
    @result_message = "We won!"
  end
  erb(:play_game)
end

get("/paper") do
  @player_message = "We played paper!"
  opponent_id = rand(0..2)
  opponent = rps[opponent_id]
  @opponent_message = "They played " + opponent + "!"
  if opponent == rps[0]
    @result_message = "We won!"
  elsif opponent == rps[1]
    @result_message = "We tied!"
  elsif opponent == rps[2]
    @result_message = "We lost!"
  end
  erb(:play_game)
end

get("/scissors") do
  @player_message = "We played scissors!"
  opponent_id = rand(0..2)
  opponent = rps[opponent_id]
  @opponent_message = "They played " + opponent + "!"
  if opponent == rps[0]
    @result_message = "We lost!"
  elsif opponent == rps[1]
    @result_message = "We won!"
  elsif opponent == rps[2]
    @result_message = "We tied!"
  end
  erb(:play_game)
end
