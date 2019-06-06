class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self.join.to_i.hash
  end
end

class String
  def hash
    alph = ('a'..'z').to_a
    self.split("").map{|ele|alph.index(ele)}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.values.sort.map{ |ele| ele.hash }.hash
    # self.to_a.flatten.map { |el| el.is_a?(Symbol) ? el.to_s.hash : el.hash }.hash
  end
end

# p 1.hash 
# "s".to_i"