require 'byebug'
require_relative './lib/game.rb' 
require_relative './lib/player.rb'
DICTIONARY_PATH = "./lib/dictionary.txt" #going to origin of the files
d = Dictionary.new(DICTIONARY_PATH)

p1 = Player.new
p2 = Player.new
players = [p1, p2]

Game.new(players, d).play
