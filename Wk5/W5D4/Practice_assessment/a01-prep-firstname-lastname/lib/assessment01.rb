require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    if accumulator == nil 
      starting_value = self.first 

    else
      starting_value = accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |i|
    return false if num % i == 0
  end 
  true
end

def primes(num)
  return [] if num == 0
  arr = [] 
  i = 2
  while arr.count < num
    arr << i if is_prime?(i)
    i += 1
  end
  arr
    
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  # return 1 if num == 0
   
  #   [num] << factorials_rec(num - 1)
  
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|k, v| k[v] = [] }
    self.each_with_index do |ele, idx|
      hash[ele] << idx if self.count(ele) >= 2 
    end
    hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    arr = []
    self.each_char.with_index do |char1, idx1|
      self.each_char.with_index do |char2, idx2|
        arr << self[idx1..idx2] if idx2 > idx1
      end
    end
    arr.select { |ele| ele == ele.reverse }
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.count <= 1
    pivot = self.length / 2
    prc.call(self)

    left_sorted = merge_sort(0...pivot) 
    right_sorted = merge_sort(pivot..-1)
  end

  private
  def self.merge(left, right, &prc)
  end
end
