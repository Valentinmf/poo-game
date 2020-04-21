require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def perform
  player1 = Player.new("José")
  player1 = Player.new("Josiane")

  while player2.life_points > 0 && player1.life > 0 do
    player1.show_state
    player2.show_state
    puts "Fight :"
    player1.attacks(player2)
    player1.attacks(player1) if player2.life_points > 0
  end
  
end
perform

binding.pry