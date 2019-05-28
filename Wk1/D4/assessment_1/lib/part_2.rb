def element_count(arr)
    ans = Hash.new(0)
    arr.each do |ele|
        ans[ele] += 1
    end
    ans
end

def char_replace!(str, hash)
  (0..str.length - 1).each do |i|
    char = str[i]
    if hash.has_key?(char)
        str[i] = hash[char]
    else
        char
    end
    i += 1
end
    str
end

def product_inject(arr)
    arr.inject { |acc, ele| acc * ele}
end