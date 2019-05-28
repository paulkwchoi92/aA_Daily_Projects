class Board
    attr_reader :size
  def initialize(n) # n for setting grid lay out 
    @grid = Array.new(n) {Array.new(n, :N)} #distinctive locaition arrays
    @size = n * n
  end

  def [](pair)
    row, column = pair
    @grid[row][column]
  end

  def []=(pair,value)
    row, column = pair
    @grid[row][column] = value
  end

  def num_ships
    count = 0
    @grid.each do |ele1|
        ele1.each do |ele2| # because a grid is a 2d array, only needs to be nested once
            if ele2 == :S
                count += 1
            end
        end
    end
    count 
   end

   # walk through method ; @grid.flatten.count flatten turns 2d into 1d

   def attack(pos)
    if self[pos] == :S # calling Board method #[] doesnt need to specify @grid because 
        self[pos] = :H # #[] method specifies grid
        puts "you sunk my battleship!"
        return true
    else
        self[pos] = :X
        return false
    end
   end

   def place_random_ships
    ships_on_grid = @size * 0.25
 
    while self.num_ships < ships_on_grid # will count until 
    rand_row = rand(0...@grid.length) #iterating random over and over
    rand_column = rand(0...@grid.length) # grid.length will be the same number since it's a square
    pos = [rand_row, rand_column]
    self[pos] = :S
    end

   end

   def hidden_ships_grid
    @grid.map do |ele|
      ele.map do |ele2|
        if ele2 == :S 
          :N 
        else 
          ele2
        end
      end
    end
   end

   def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print 
    Board.print_grid(self.hidden_ships_grid)
  end

end
