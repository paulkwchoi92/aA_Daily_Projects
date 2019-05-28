require 'byebug'
require 'benchmark'

def range_it(start, finish)
    range = []

    (start...finish).each { |num| range << num }

    range

end

def range(start, finish)
    return [] if start >= finish

    [start] + range(start + 1, finish)
end

def exp1(b, n)
    return 1 if n == 0

    b * exp1(b, n - 1)
end

def exp2(b, n)
    # return 1 if n == 0
    return b if n == 1

    if n.even?
        # debugger
        b * exp2(b, (n / 2)) 
    else
        b * (exp2(b,(n -1)/ 2) * b)   
    end    
end

class Array 

    def deep_dup 
        return self.dup if self.length < 2
        arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                arr << ele.deep_dup
            else
                arr << ele.dup
            end
        end
        arr
    end
end

#[0, 1, 1, 2, 3, 5, 8, 13, 21]
def fib(n)
 return [0, 1].take(n) if n <= 2

 prev_fib = fib(n - 1)
 prev_fib << (prev_fib[-1] + prev_fib[-2])
 
end

def fib_i(n)
   return [0, 1].take(n) if n <= 2
   if n > 2
    fibs = [0, 1]
    (n - 2).times { fibs << (fibs[-1] + fibs[-2]) }
   end

  fibs

end

# p Benchmark.measure { fib(10000) }
# p Benchmark.measure { fib_i(10000) }


# we want to split arr in two, check target against middle... return index of target if equal.
# if target is less than middle... perform the search with left half, if greater... perform it with the right half

def b_search(arr, target)
    return nil if arr.empty?
    mid = arr.length / 2
    # return mid if arr[mid] == target
    # debugger
    if arr[mid] > target
        return b_search(arr.take(mid), target)
    elsif arr[mid] == target
        return mid
    else
        idx = b_search(arr[mid + 1..-1], target)
        idx.nil? ? nil : ((mid + 1) + idx)
        #     return nil
        # else
        #     return (mid + 1) + idx
        # end
    end
end

# def b_search(arr, target)
#     return nil if arr.length <= 1 && arr[0] != target

# end

# p b_search([1, 2], 3) # => nil
# p b_search([1, 2, 3], 1) # => 0
# p b_search([2, 3, 4, 5], 3) # => 1
# p b_search([2, 4, 6, 8, 10], 6) # => 2
# p b_search([1, 3, 4, 5, 9], 5) # => 3
# p b_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p b_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p b_search([1, 2, 3, 4, 5, 7], 6) # => nil

# arr = (1..10000).to_a.shuffle
# [5,3,2,1]

def merge_sort(arr)
  return arr if arr.length <= 1 

  pivot =  arr.length / 2
  left_sorted = merge_sort(arr[0...pivot])
  right_sorted = merge_sort(right = arr[pivot..-1])

  merge(left_sorted, right_sorted)
end


def merge(left_sorted, right_sorted)
    merge = []

    until left_sorted.empty? ||  right_sorted.empty?
        case left_sorted.first <=> right_sorted.first
        when -1
            merge << left_sorted.shift
        when 0
            merge << left_sorted.shift
        when 1
            merge << right_sorted.shift
        end 
    end
    merge.concat(left_sorted)
    merge.concat(right_sorted)
    merge
end


def subsets(arr) # s_1arr = [1, 2]
                 # s2 = [1]
                
    return [[]] if arr.empty? 
    # debugger
    subs = subsets(arr[0...-1]) #[[], [1]]
    s2 = []
    subs.each { |sub| s2 << (sub + [arr.last]) } #s2[[], [1]]
    # # s2 - [[2], [1, 2]]
    subs + s2 
    # subs.concat(subs.map{ |sub| sub + [arr.last] })

end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# p subsets([1,2,3,4]) # [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3], [4], [1, 4], [2, 4], [1, 2, 4], [3, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]


# write a recursive method permutations(array) that calculates all the permutations 
# of the given array. For an array of length n there are n! different permutations. 
# So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.
   #returning different possible combiantions of passed on legnth of arr?
   #if not length is passed on the default would be length of the passed on array

# def permutations(arr)
# end

p [ 1, 2, 3].permutation#.to_a  # => [[1, 2, 3], [1, 3, 2],
                            #     [2, 1, 3], [2, 3, 1],
                            #     [3, 1, 2], [3, 2, 1]]


#4322
# def digital_root(num)
#     # debugger
#     while num > 10
#         num = digital_root_step(num)
#     end
    
#     num
# end
# def digital_root_step(num)
#     root = 0

#     while num > 0
#         root += (num % 10)

#         num / = 10
#         num = num / 10
#     end

#     root
# end


#  return [[]] if arr.empty?
#     subs = subsets(arr[0...-1])
#     s2 = []
#     subs.each { |sub| s2 << (sub + [arr.last]) }
#     subs + s2