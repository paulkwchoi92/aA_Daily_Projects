class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr_of_chars)
    arr_of_chars.all? do |ele|
      POSSIBLE_PEGS.has_key?(ele.upcase)
    end
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise " Error"
    end
  end

  def self.random(num)
    random_code = []
    num.times { random_code << POSSIBLE_PEGS.keys.sample }
    Code.new(random_code)
  end

  def self.from_string(repstring)
    Code.new(repstring.split(""))
  end
   
  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end
  
  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
        count += 1 if guess[i] == self[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count += 1 if guess[i] != self[i] && self.pegs.include?(guess[i])
    end
    count
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
