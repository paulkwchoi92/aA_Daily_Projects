def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end

def nth_prime(n)
    prime = [2]
    num = 1

    while prime.length <= n
        num += 1
        if is_prime?(num)
        prime << num
        end
    end

    prime[-1]
end

def prime_range(min, max)
    arr = []
    (min..max).each do |i|
        arr << i if is_prime?(i)
    end
    arr
end