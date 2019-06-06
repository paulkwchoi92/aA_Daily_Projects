class HashSet
  attr_reader :store
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    hash = key.hash
    unless @store[hash % num_buckets].include?(key)
      @store[hash % num_buckets] << key
      @count += 1
      return true 
    end 
    false
  end

  def include?(key)
    hash = key.hash
    @store[hash % num_buckets].include?(key)
  end

  def remove(key)
    hash = key.hash
    if @store[hash % num_buckets].include?(key)
      @store[hash % num_buckets].delete(key) 
      @count -= 1
    end

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_store = @store.map { |ele| ele }
    @store = @store.concat(@store.dup).map { |ele| ele = []}
    @count = 0
    prev_store.each do |ele|
      ele.each do |ele2|
        self.insert(ele2) unless ele2 == nil
      end
    end
  end
end
