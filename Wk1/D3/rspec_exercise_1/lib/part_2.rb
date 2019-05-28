def hipsterfy(str)
    i = str.length - 1
    vowel = "aeiou"
    while i > 0
        if vowel.include?(str[i])
            str[i] = ""
            break
        end
        i -= 1
    end
    str
end

def vowel_counts(str)
    vhash = Hash.new(0)
    vowels = "aeiou"
    arr = str.downcase.split("")
    arr.each do |ele|
        if vowels.include?(ele)
            vhash[ele] += 1
        end
    end
    vhash
end

def caesar_cipher(str, num)
    alphabet = ("a".."z").to_a
    ans = ""
    
    str.each_char do |char|
        if alphabet.include?(char)
        old_idx = alphabet.index(char)
        new_idx = old_idx + num
        ans += alphabet[new_idx % 26]
        else 
            ans += char
        end
    end
    ans
end