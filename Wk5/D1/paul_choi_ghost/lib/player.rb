class Player
FIRST_NAME = %w(Elise Aiden Elle Anna Callie)
LAST_NAME = %w(Mccann Berger Kelley Chan Krueger)
GHOST = "ghost"
attr_reader :name 
attr_accessor :points
 def initialize(f_n = FIRST_NAME.sample, l_n = LAST_NAME.sample)
    @name = "#{f_n} #{l_n}"
    @points = 0
 end

 def score
    GHOST[0...@points]
end
  
def get_guess
    guess = nil
    alpha = ("a".."z").to_a
    until alpha.include?(guess)
        puts "#{@name} guess: "
        guess = gets.chomp 
        if !alpha.include?(guess)
            puts "Invalid Guess, try again:"
        end
    end
    guess
end
 
def is_ghost?
    @points >= 5
end



end