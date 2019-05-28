def depth_first(node, visited = Set.new())
  # depth node is to make this recursion not infinite
  return nil if (visited.include?(node,val))

  # otherwise it hasn't yet been visited,
  # so prit its val and mark it as visited

  puts node.val # this line can be used to iterate the datastructure or build
  visited.add(node.val)

  # then explore each of it's neighbors
  node.neighbors.each do |neighbor|
    depth_first(neibor,visted) #recrusion will lead bakc to line 4
  end
end


## Graph Traverssal w/ Adjacency list


graph = {
  'a': ['b', 'c', 'e'],
  'b': [],
  'c': ['b', 'd'],
  'd': [],
  'e': ['a'],
  'f': ['e']
}

def depth_first(node, graph, visited = Set.new())
  return nil if visited.include?(node.to_sym)

  puts node
  visited.add(node.to_sym)

  graph[node.to_sym].each do |neighbor

    depth_first(neighbor, graph, visited)
  end
end

## this function is problematic because it won't let us reach all nodes
# if we were to choose a bad starting point such as A

# solution

def depth_first(graph)
  visited = Set.new()
  graph.keys.each do |node|
    _depth_first(node, graph, visited)
  end
end

def _depth_first(node, graph, visited)
  return nil if visited.include?(node.to_sym)
  puts node
  visited.add(node.to_sym)

  graph[node.to_sym].each do |neighbor|
    _depth_first(neighbor, graph, visited)
  end
end

depth_first(graph)


# recrusion inside an iteration
e
