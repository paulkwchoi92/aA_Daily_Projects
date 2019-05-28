require_relative '00_tree_node.rb'
require 'byebug'

class Kpf
    attr_reader :start_pos, :considered_positions 
    attr_accessor :child
    def valid_moves(pos)  #[4,4].valid_moves([5,6])
        return false if pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
        case 
        when self.value[0] - 1 == pos[0]  #4 4  3, 6   3, 2
            return true if pos[1] - 2 == self.value[1]
            return true if pos[1] + 2 == self.value[1]
        when self.value[0] + 1 == pos[0] 
            return true if pos[1] - 2 == self.value[1]
            return true if pos[1] + 2 == self.value[1]
        when self.value[1] - 1 == pos[1] 
            return true if pos[0] - 2 == self.value[0]
            return true if pos[0] + 2 == self.value[0]
        when self.value[1] + 1 == pos[1] 
            return true if pos[0] - 2 == self.value[0]
            return true if pos[0] + 2 == self.value[0]
        end
        false
    end

    def initialize(pos)
        @start_pos = pos 
        @considered_position = [pos]
        # @considered_positions = [pos]
        build_tree
    end 
    

    def possible_moves
        moves =   [[-2, -1],
                    [-2, 1],
                    [-1, -2],
                    [-1, 2],
                    [1, -2],
                    [1,  2],
                    [2, -1],
                    [2,  1]]
        array = []
    
        moves.each do |move|
            array << [move[0] + self.value[0], move[1] + self.value[1]]
        end
        array.select { |ele| valid_moves(ele) && ele != @consider_position}
        .each { |new_pos| considered_positions << new_pos }
    end
 attr_accessor :root_node
    def build_tree
        self.root_node = PolyTreeNode.new(start_pos)

        nodes = [root_node]
        until nodes.empty?
            current_node = nodes.shift
            current_pos = current_node.value
            self.possible_moves.each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end
        end     
    end

end

#     let(:nodes) { ('a'..'g').map { |value| PolyTreeNode.new(value) } }

#   before do
#     parent_index = 0
#     nodes.each_with_index do |child, index|
#       next if index.zero?
#       child.parent = nodes[parent_index]
#       parent_index += 1 if index.even?
#     end
#   end