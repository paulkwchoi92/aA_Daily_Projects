require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(guess)
    puts "Exact matches are #{@secret_code.num_exact_matches(guess)}"
    puts "Near matches are #{@secret_code.num_near_matches(guess)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    input = gets.chomp
    guess = Code.from_string(input)
    self.print_matches(guess) #calling it on the secret code
    @secret_code == guess 
  end
end
