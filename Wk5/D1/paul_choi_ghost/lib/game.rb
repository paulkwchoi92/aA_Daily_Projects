require 'set'

class Dictionary
    DICTIONARY_PATH = "./lib/dictionary.txt" #going to origin of the files
    
    attr_accessor :dictionary

    def initialize(dictionary_path = DICTIONARY_PATH)
        @dictionary = File.readlines(dictionary_path).map(&:chomp).to_set
    end

    def length
        @dictionary.length
    end

    def update(fragment)
        @dictionary = @dictionary.select do |word|
            fragment == word[0...fragment.length]
        end
    end
    
    def valid_word?(word)
        @dictionary.include?(word)
    end
   
    def valid_fragment?(fragment)
        @dictionary.any? do |word|
            fragment == word[0...fragment.length]
        end
    end
end

class Game
    attr_accessor :current_player

  def initialize(players, dictionary=Dictionary.new)
    @players = players
    @dictionary = dictionary
    @fragment = "" 
    @current_player = players.first
  end

  def play
    
    until game_over?
        @fragment = ""
        play_round
        
    end

    @players.each do |player|
        if !player.is_ghost?
            "#{player.name} wins!"
        end
    end
  end
  
  def play_round
    puts "#{@current_player.name} turn"
    score_board
    # byebug
    until @dictionary.valid_word?(@fragment)
        take_turn(@current_player)
        if @dictionary.valid_word?(@fragment)
            @current_player.points += 1
            break
        end
        next_player!
    end

    # @current_player.points += 1
  end

  def game_over?
    @players.count {|player| !player.is_ghost?} == 1
  end

  def next_player!
    # byebug
     idx = @players.index(@current_player)
     idx = (idx + 1) % @players.length
    @current_player = @players[idx]
  end  

  def take_turn(player)
     ans = player.get_guess 
       until valid_play?("#{@fragment}#{ans}")
        ans = player.get_guess 
       end 
        @fragment = "#{@fragment}#{ans}"
        puts @fragment
  end

  def valid_play?(str)
    @dictionary.valid_fragment?(str)
  end

  def score_board 
    plyrs = @players.map do |player| 
        "#{player.name} : #{player.points}"
    end
    puts plyrs.join(' ')
    
 end

end