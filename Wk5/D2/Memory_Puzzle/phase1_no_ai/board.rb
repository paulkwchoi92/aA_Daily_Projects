require 'byebug'
require_relative 'card'



class Board
  attr_reader :size, :grid
    
   def initialize(size)
        @grid = Array.new(size) {Array.new(size, nil)}
        @size = size 
        populate
    end

    def [](pos)
      row, col = pos 
      grid[row][col]
    end 

    def []=(pos,value)
      row, col = pos 
      grid[row][col] = value 
    end 

   

    def populate
      # debugger
      num_pairs = (size**2) / 2 
      cards = Card.shuffled_pairs(num_pairs)
      grid.each_index do |i|
        grid[i].each_index do |j|
          self[[i, j]] = cards.pop
        end 
      end
    end 

    def render
      system("clear") #clears the terminal, used for hiding the cards after being revealed
      puts "  #{(0...size).to_a.join(' ')}" #marking rows on top of grid
      grid.each_with_index do |row, i|
        puts "#{i}  #{row.join(' ')} " # marking colums, and cards
      end
      # debugger
    end 

    def revealed?(pos)
      self[pos].revealed?
    end

    def reveal(pos)  # needs to reveal only if card#revealed = false
      if revealed?(pos)
        puts "you can't flip a card that has already been revealed"
      else
        self[pos].reveal  #slef[pos] will refer to a card, thus card method can be called 
      end
      self[pos].value #showing the value once it's been revealed
    end


    def won?
      grid.all? do |rows|
        rows.all?(&revealed?)
      end
    end 

    



end