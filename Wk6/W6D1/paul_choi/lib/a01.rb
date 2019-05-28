# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr.length == 0
  pivot = arr.size / 2
  case arr[pivot] <=> target 
  when 0 
    return pivot
  when 1
    return binary_search(arr.take(pivot), target)
  else
    search = binary_search(arr.drop(pivot + 1), target)
    search.nil? ? nil : pivot + 1 + search
  end
end


class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target = 0)
    ans = [] 
    self.each_with_index do |ele, idx|
      self.each_with_index do |ele2, idx2|
        if idx2 > idx && ele + ele2 == target
          ans << [idx, idx2]
        end
      end
    end
    ans
  end
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
  return 0 if nums.empty?
  return nums[0] if nums.length < 2
  nums[0] + sum_rec(nums[1..-1])
end

class String
  # Write a method that finds all the unique substrings for a word

  def uniq_subs
    ans = []
    (0...self.length).each do |i|
      (0...self.length).each do |j|
        if j >= i
        subs = self[i..j]
        ans << subs if !ans.include?(subs)
        end
      end
    end
    ans
  end
end
#"s", "st", "str", "", "t", "tr", "r"]
# 00    01     02   10

def prime?(num)
  return true if num == 2
  (num-1).downto(2).each do |i|
    return false if num % i == 0
  end
  true
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
  return 0 if n == 0 
  return 2 if n == 1
  sum = 0 
  i = 2 
  count = n #2
  while count >= 1
     if prime?(i)
     count -= 1
     sum += i
     end
      i += 1
    
  end
  sum
end
#3

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0 
    while i < self.length
      prc.call(self[i])

      i +=  1
    end
    self
  end
end

class Array
  # Write a method that calls a block for each element of the array
  # and returns a new array made up of the results
  def my_map(&prc)
    ans = []
    self.each { |ele| ans << prc.call(ele)}
    ans
  end
end
