# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(num)
    arr = []
    (2..num).each do |i|

        arr << i if prime?(i) && num % i == 0
    end
 arr.last
end

# app academy answers
def largest_prim_factor(num)
  num.downto(2) do |i| #because you want to check for the largest prime, starting from the top
    if num % i == 0 && prime?(i)
      return i
    end
  end
end



def prime?(num)
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end
-----
def unique_chars?(str)
    str.each_char.with_index do |char1, idx1|
        str.each_char.with_index do |char2, idx2|
            if idx2 > idx1 && char2 == char1
                return false
            end
        end
    end
    true
end

## appacademy answer
def unique_char?(str)
  already_seen = []
  string.each_char do |char|
    if already_seen.include?(char)
      return false
    end
    already_seen << char
  end
  true
end
-----
def dupe_indices(arr)
    ans = Hash.new { |k, v| k[v] = []} #how to set default value of a hash value as arr where values can be pushed into/
    arr.each_with_index do |ele, idx|
        ans[ele] << idx if arr.count(ele) >= 2
    end
    ans
end
# appacademy answer
def dupe_indices(arr)
  indicies = Hash.new { |k,v| k[v] = []} #because you want distinct arrays
  array.each_with_index do |ele, i|
    indicies[ele] << i
  end
  indicies.select { |k, v| v.length > 1}
end

---
def ana_array(arr1, arr2)
    if arr1.length != arr2.length
        return false
    elsif arr2.length <= arr1.length
        arr2.each { |ele|return false if !arr1.any?(ele) }
    elsif arr1.length > arr2.length
            arr1.each  {|ele| return false if !arr2.any?(ele)}
    end
true
end

## appacademy
def ele_count(arr)# want hash where keys are elements, and values are number of times it appears
  count = Hash.new(0)

  arr.each { |ele| count[ele] += 1}

  count
end
def ana_array(arr1, arr2)
 count1 = ele_count(arr1)
 count2 = ele_count(arr2)
 count1 == count2 #order doesn't matter in evaluating two hashes
end
