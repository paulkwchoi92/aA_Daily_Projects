require 'byebug'

class Card
  VALUES = ("A".."Z").to_a

  def self.shuffled_pairs(num_pairs)
    # debugger
    values = VALUES

    while num_pairs > values.length # this code is for when the game is bigger than 26 characters
      values = values + values
      
    end
    values = values.shuffle.take(num_pairs) * 2 # putting the values into pairs
    # debugger
    values.shuffle!
    values.map { |val| self.new(val) } #putting the values into cards
  end

  attr_reader :value

  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

    def reveal
        @revealed = true
    end 

    def hide 
        @revealed = false
    end 

    def to_s 
        revealed? ? value.to_s : " "
    end 

    def revealed?
        @revealed
    end


    def ==(pbject)
        object.is_a?(self.class) && object.value == value
    end
end 