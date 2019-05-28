class Array
# My Each
# Extend the Array class to include a method named my_each that takes a block, 
# calls the block on every element of the array, and returns the original array. 
# Do not use Enumerable's each method. I want to be able to write:

    def my_each(&prc)
        (0...self.length).each do |i|
            prc.call(self[i])
        end
        
        self
    end

# My Select
# Now extend the Array class to include my_select that takes a block and returns 
# a new array containing only elements that satisfy the block. Use your my_each method!

    def my_select(&prc)
        result = []

        self.each do |el|
            result << el if prc.call(el)
        end
        result
    end

# My Reject
# Write my_reject to take a block and return a new array excluding elements 
# that satisfy the block.
def my_reject(&prc)
        result = []

        self.each do |el|
            result << el unless prc.call(el)
        end
        result
    end
  

# My Any
# Write my_any? to return true if any elements of the array satisfy the block 
# and my_all? to return true only if all elements satisfy the block.
def my_any?(&prc)
    self.each do |el|
        return true if prc.call(el)
    end
    false
end

def my_all?(&prc)
    self.each do |el|
        return false if !prc.call(el)
    end
    true
end

# My Flatten
# my_flatten should return all elements of the array into a new, one-dimensional 
# array. Hint: use recursion!

def my_flatten 
 return self if self.empty?
 result  = [] 
 self.each do |ele|
    if ele.is_a?(Array)
        result += ele.my_flatten
    else
        result << ele
    end
end
result
end


# My Zip
# Write my_zip to take any number of arguments. It should return a new array 
# containing self.length elements. Each element of the new array should be an 
# array with a length of the input arguments + 1 and contain the merged elements 
# at that index. If the size of any argument is less than self, nil is returned 
# for that location.
def my_zip(*arrays)
    result = []
    
    (0...self.length).each do |i|
        ans = [self[i]]
        arrays.each do |el|
            ans << el[i]
        end

        result << ans
    end
        result
end
# My Rotate
# Write a method my_rotate that returns self rotated. By default, the array should 
# rotate by one element. If a negative value is given, the array is rotated in the 
# opposite direction.

def my_rotate(num=1)
    result = self.dup 
 if num > 0
    num.times { result.push(result.shift) }
 else
    num.abs.times { result.unshift(result.pop)}
 end
 result
end

# My Join
# my_join returns a single string containing all the elements of the array, 
# separated by the given string separator. If no separator is given, an empty 
# string is used.
def my_join(delimiter="")
    result = self[0]

    (1...self.length).each do |i|
        result += "#{delimiter}#{self[i]}"
    end
    result
end
# My Reverse
# Write a method that returns a new array containing all the elements of the 
# original array in reverse order.

def my_reverse
    result = []
    (0...self.length).each do |i|
        idx = self.length - 1 - i
        result << self[idx]
    end 
    result 
end

end

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#   end.my_each do |num|
#     puts num
#   end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]

#  p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         == ["b", "c", "d", "a"]
# p a.my_rotate(2)      == ["c", "d", "a", "b"]
# p a.my_rotate(-3)     == ["b", "c", "d", "a"]
# p a.my_rotate(15)     == ["d", "a", "b", "c"]
# a = [ "a", "b", "c", "d" ]
# p a.my_join         == "abcd"
# p a.my_join("$")    == "a$b$c$d"
# p a.my_join("$")    == "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   == ["c", "b", "a"]
# p [ 1 ].my_reverse               == [1]


def factors(num)
    result = []

    (1..num).each do |i|
        result << i if num % i == 0
    end

    result
end

class Array
    def bubble_sort!(&prc)
        prc ||= Proc.new { |a, z| a <=> z}
        (0...self.length).each do |i|
            ((i + 1)...self.length).each do |j|
                if prc.call(self[i], self[j]) == 1
                self[i], self[j] = self[j], self[i]
                end
            end
        end 
        return self


    end

    def bubble_sort(&prc)
        self.dup.bubble_sort!(&prc)
    end
end

def substrings(string)
    result = []
    (0...string.length).each do |i|
        ((i + 1)...string.length).each do |j|
            result << string[i..j]
        end
    end
    result
end

def subwords(word, dictionary)
 substring(word).select { |ele| dictionary.include?(ele)}

end