require_relative 'player'

class Dealer < Player
  attr_reader :bets, :name, :bankroll

  def initialize
    super("dealer", 0)
    

    
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
  end

  def take_bet(player, amt)
  end

  def pay_bets
  end
end
