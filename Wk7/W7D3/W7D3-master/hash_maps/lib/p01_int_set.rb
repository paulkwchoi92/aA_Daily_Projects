require 'byebug'
class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false) 
    # max = @store.length
  end
  

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    return false  if @store[num]
    @store[num] = true
    true
  end

  def remove(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = false if @store[num]
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false if num > @store.length || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num 


    true
  end

  def remove(num)
    @store[num % num_buckets] -= [num]
  end

  def include?(num)
    @store[num % num_buckets].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :store
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    unless @store[num % num_buckets].include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
    true
  end

  def remove(num)
    if @store[num % num_buckets].include?(num)
      @store[num % num_buckets] -= [num]
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    # @store.all? { |array| !array.empty? }
    prev_store = @store.map { |ele| ele }
    @store = @store.concat(store.dup).map { |ele| ele = []}
    @count = 0
    prev_store.each do |ele|
      ele.each do |ele2|
        self.insert(ele2) unless ele2 == nil
      end
    end
    #get store, save old store (to populate later)
    #count, taken care of
    #new_store.insert(num) 
  end
end
