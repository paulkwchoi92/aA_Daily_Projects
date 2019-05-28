def proper_factors(num)
 ans = []
 (1...num).each do |i|
    ans << i if num % i == 0 && i < num 
 end
 ans
end

def aliquot_sum(num)
    ans = proper_factors(num)
    ans.sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    false
end

def ideal_numbers(num)
    ans = []
    (1..1000).each do |i|
        ans << i if perfect_number?(i)
    end
    ans[0...num]
end