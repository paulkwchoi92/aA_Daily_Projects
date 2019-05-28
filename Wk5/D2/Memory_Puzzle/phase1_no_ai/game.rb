require_relative 'board'
require_relative 'card'
require 'byebug'

class Game
  attr_reader :board 
    def initialize(size)
        @board = Board.new(size)
        @previous_guess = nil

    end

    def play 
        until board.won?
        board.render #needs to render new grid everytime
        play_turn
        end
    end 

    def match?(pos)
    end



    def play_turn 
    end 

    def get_pos 
        pos = nil 
        until pos && valid_pos?(pos) #nil = false, iuntil true, and ture, get input will be ran
            pos = get_input
        end
        pos
    end 

    def get_input
        prompt  # dividing the get input method into differet methods
        parse(STDIN.gets.chomp)  #STDIN stands for variable that holds standard in put
       
    end

    def prompt 
         puts "Please enter the postion of the card you'd like to flip(e.g., '2,3'"
        print "> "

    end

    def parse(str)
        str.split(",").map { |i| Integer(i) } #turning input into an array
    end

    
    def valid_pos?(pos)
        pos.is_a?(Array) &&
        pos.count == 2 &&
        pos.all? { |i| i.between?(0, board.size - 1) # between checks if ele it's called is between two parameter it's passed into
    end





end 