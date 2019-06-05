require 'byebug'
# --------- PHASE 1 ---------------- 

#time complexity = O(n^2)

# def my_min(arr)
#     arr.each_with_index do |ele, i|
#         return ele if ((i+1)...arr.length).none? {|i2| arr[i2] < ele}
#     end
# end
            

# --------- PHASE 2 ---------------- 

#time complexity = O(n)

# def my_min(arr)
#     i = 0
#     arr.each do |ele|
#        i = ele  if ele < i 
#     end
#     i
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#--------------------------------------

#time: O(n^4)


# def largest_contiguous_subsum(arr)
#     subs = []
#     arr.each_with_index do |ele, i1|
#         arr.each_with_index do |ele2, i2|
#             subs << [ele] if i1 == i2
#             subs << arr[i1..i2] if i2 > i1
#         end
#     end
#     subs.map! do |ele|
#         ele = ele.sum
#     end

#     subs.max
# end 


# ---------------------------------------

def largest_contiguous_subsum(arr)

    largest = arr[0]
    current = arr[0]
    
    # debugger
    arr.drop(1).each do |ele| #O(n)
        current = 0 if current < 0
        current += ele
        largest = current if current > largest
    end
    largest

end
#   [2, 3, -6, 7, -6, 7]
# c  2  5  -1  6  0  7
# c  2  5  0   7  1  8 
# l  2  5  5   6  6  7 ----> 7

 list = [5, 3, -7]
 p largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])