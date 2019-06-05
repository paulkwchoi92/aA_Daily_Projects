require_relative 'card'

# Represents a deck of playing cards.
class Deck
  
  # Returns an array of all 52 playing cards.
  def self.all_cards
    deck = [] 
    Card.values.each do |vals|
      Card.suits.each do |suit|
        card = Card.new(suit, vals)
        deck << card if !deck.include?(card)
      end
    end
    deck
  
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    cards.count

  end

  # Takes `n` cards from the top of the deck.
  def take(n)
   dealt = []
   
    n.times do 
      raise "not enough cards" if cards.empty?
      a = cards.shift
      dealt << a
      end 
    
    dealt
  end

  # Returns an array of cards to the bottom of the deck.
  def return(m_cards)
    m_cards.each do |card|
      cards << card 
    end
  end
  protected
  attr_reader :cards
end
