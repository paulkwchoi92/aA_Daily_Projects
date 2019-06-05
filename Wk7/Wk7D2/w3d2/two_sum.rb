require 'byebug'
#time : O(n^2)
#space : O(n)

def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        ((i + 1)...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum 
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

 #time = O(nlog(n))
def okay_two_sum?(arr, target)
    arr.sort!
    arr.each do |ele| 
        n_t = target - ele
        return true if arr.bsearch(n_t)
    end
    false
end


# arr = [0, 1, 5, 3, 7]
# p okay_two_sum?(arr, 10) # => should be true
# p okay_two_sum?(arr, 8) # => should be false

def hash_two_sum?(arr, target)
    a = Hash.new(0)
    arr.each do |ele| 
        a[ele] += 1
    end

    arr.each do |ele|
         
        check_v = target - ele
        if check_v == ele
             return true if a.has_key?(check_v) && a[check_v] >= 2
        else
             return true if a.has_key?(check_v)
        end


    end
    false
end

arr = [0, 1, 5, 3, 7]
p hash_two_sum?(arr, 2) # => should be true
p hash_two_sum?(arr, 9) # => should be false

# 0 1 5 3 7
# 0 = [1, 5, 3, 7]
# 1 = [1, 6, 4, 8]
