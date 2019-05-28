# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  mult = num_1 * num_2
  max = [num_1,num_2].max
    (max).upto(mult) do |m|
        return m if m % num_1 == 0 && m % num_2 == 0
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
hash = Hash.new(0)
    (0...str.length - 1).each do |i|
        bigram = str[i] + str[i+1]
        hash[bigram] += 1
    end

    bigrams = hash.sort_by {|k,v|v}
    bigrams.last[0]

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}

        self.each { |k, v| new_hash[v] = k }

        new_hash

    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0

        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                count += 1 if idx2 > idx1 && ele1 + ele2 == num
            end
        end
      
        count

    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)

        prc ||= Proc.new { |a, b| a <=> b}

        sorted = false
        while !sorted 
        
            sorted = true 
            (0...self.length - 1).each do |idx|
                if prc.call(self[idx], self[idx + 1]) == 1
                    self[idx], self[idx + 1] = self[idx +1], self[idx]
                    sorted = false
                end
            end
        end
        self
    end
end
