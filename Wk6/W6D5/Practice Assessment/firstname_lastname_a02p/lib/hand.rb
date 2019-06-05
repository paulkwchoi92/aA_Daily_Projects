require_relative 'deck'
class Hand 
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  attr_reader :cards
  def self.deal_from(deck)
    
   a = deck.take(2)
   a
  end

  

  def initialize(cards = Hand.deal_from(deck))
    @cards = cards
  end

  def points
    sum = 0
    cards.each do |card|
      sum += card.value
    end
    sum
  end

  def cards
    @cards
  end 

  def busted?
  end

  def hit(deck)
  end

  def beats?(other_hand)
  end

  def return_cards(deck)
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
