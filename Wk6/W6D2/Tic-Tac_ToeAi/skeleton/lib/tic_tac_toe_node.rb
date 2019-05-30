require_relative 'tic_tac_toe'
require 'byebug'

class TicTacToeNode
  attr_accessor :children, :board, :prev_move_pos, :next_mover_mark
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board 
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    
 
  end
  # a = TicTacToeNode.new(Board.new, :x)
  


  def children
    childrens = []
    self.board.rows.each_with_index do |cols, i1|
      cols.each_with_index do |x, i2|
        if x == nil
          previous_mover_marker = [i1, i2]
          dup_board = self.board.dup
          dup_board[previous_mover_marker] = self.next_mover_mark
          next_mover_marker = self.next_mover_mark == :x ? :o : :x
          
          childrens << TicTacToeNode.new(dup_board, next_mover_marker, previous_mover_marker)
        end
      end
    end
    childrens
  end

  def losing_node?(evaluator)
    if board.over?
      return true if self.board.winner != evaluator
      return false if self.board.winner == evaluator || nil
    else
    
    # debugger
      self.children.each do |childnode|
       
          losing_node?(childnode)
        
      end
    end
      
        # losing_node?(childnode)
      
  end
    

 

  def winning_node?(evaluator)
    return false if board.winner != evaluator 
    return true if board.winner == evaluator 


  end

  # This method generates an array of all moves that can be made after
  # the current move.
  # def children
  #   self.board.rows.each_with_index do |row, i1|
  #     row.each_with_index do |col, i2|
  #       if col == nil
  #         self.children << TicTacToeNode.new(Board.new,)
  # end
end


# a =  empty board
# children= 9 different boards with x marks @ point x,y with parent being an empty board
# children= 8 different boards with o

# who goes first? is it random?
# xxx  xxx
# xox  xox
# xxx  xxx
