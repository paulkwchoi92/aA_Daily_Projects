class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample # method for creating random word fomr dictionary
  end

  def initialize
    @secret_word = Hangman.random_word #initializing answer, random word
    @guess_word = Array.new(@secret_word.length, "_") #creating array with length nubmer of "-"
    @attempted_chars = [] # empty array for trials
    @remaining_incorrect_guesses = 5 # numbe of times a player is given
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      true
    else
      false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |ele, idx| # because @secret_word is a string
      if ele.include?(char)
        arr << idx
      end
    end
    arr
  end

  def fill_indices(char, arr)
    arr.each do |ele|
      @guess_word[ele] = char # each element of the array is the indicies of fillers
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      print "that has already been attempted"
      return false
    end
    @attempted_chars << char
    matching = self.get_matching_indices(char)
    self.fill_indices(char, matching)

    @remaining_incorrect_guesses -= 1 if matching.empty?

    true
  end

  def ask_user_for_guess
    print "Enter a char:"
    input = gets.chomp
    try_guess(input)
  end

  def win?
   if @guess_word.join("") == @secret_word
    p "WIN"
    return true
   else
    return false
   end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      false
    end
  end

  def game_over?
   if self.win? || self.lose?
    p @secret_word
    return true
   else !self.win? && !self.lose?
    return false
   end
  end
end
