require 'byebug'
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    raise "Empty list" if empty?
    @head.next
  end

  def last
    raise "Empty list" if empty?
    @tail.prev
  end

  def empty?
    self.head.next == self.tail
    # debugger
  end

  def get(key)
    self.each do |node| return node.val if node.key == key end
  end

  def include?(key)
    self.each do |node| return true if node.key == key end
      false
  end

  def append(key, val)
    node = Node.new(key, val)
    new_app = @tail.prev
    new_app.next = node 
    @tail.prev = node
    node.next = @tail
    node.prev = new_app
  end


  def update(key, val)
    self.each do |node| node.val =  val if node.key == key end
  end

  def remove(key)
    self.each do |node|
      if node.key == key 
        prev_node = node.prev
        next_node = node.next
        prev_node.next = next_node 
        next_node.prev = prev_node
      end
    end
  end

  def each
    current_node = @head.next
    # arr = []
    # debugger
    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
    # arr
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
