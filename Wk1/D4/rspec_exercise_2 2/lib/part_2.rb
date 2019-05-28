def palindrome?(str)
    check = ""
    i = str.length - 1
    while i >= 0
        check << str[i]
        i -= 1
    end
    if str == check
        true
    else
        false
    end
end

def substrings(str)
    ans = []
   (0...str.length).each do |idx1|
    (idx1...str.length).each do |idx2|
        ans << str[idx1..idx2]
    end
end
ans
end

def palindrome_substrings(str)
    substrings(str).select { |ele| palindrome?(ele) && ele.length > 1}
end