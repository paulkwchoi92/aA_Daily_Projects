class PolyTreeNode
    attr_reader :value
    attr_accessor :parent, :children

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end
                                
    def parent=(value)
        if self.parent == nil
            @parent = value
            @parent.children << self
        else
            @parent.children.delete(self)  
            @parent = value
            if @parent != nil
            @parent.children << self
            end
        end
    end

    def add_child(childnode)
        childnode.parent = self 
        child = childnode
    end

    def remove_child(childnode)
        childnode.parent = nil
    end




    def dfs(target)  #dfs(target_value)
        # return nil if self.nil?
        return self if self.value == target
        self.children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result.nil?
        end
        nil
    end


    def bfs(target)
        queue = self          
        until queue.empty? 
            el = queue.shift
            return el if el.value == target 
            el.children.each { |child| queue << child }
        end
        nil
    end

end


# def BFS 
# queue = root
# until queue.empty?
#     el = queue.shift
#     process(el)
#     el.children.each {|child| queue << child}
# end


# DFS
# def dfs(root, target)
#     return nil if root.nil?
#     return root if root.val == target
#     root.children.each do |child|
#         search_result = dfs(child, target)
#         return search_result unless search_result.nil?
#     end
#     nil
# end




   

