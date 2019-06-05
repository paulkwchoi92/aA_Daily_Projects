#time_complexity = O(n^2)
#space = O(n)

# ------ PHAASE 1 ---------------

def first_anagram?(str, str2)
   
    ana = str.chars.permutation.to_a.map!(&:join)
    
    ana.include?(str2)
end   

             
p first_anagram?("cat", "tac")

# [c,a,t]

# c + a + t 
# c + t + a
# a + c + t
# a + t + c
# t + a + c
# t + c + a
 
# ---------- PHASE 2 ----------------

# time : O(n^2)
# space : O(n)

def second_anagram?(str1, str2)
    var2 = str2.split("")

    str1.each_char do |char|
        return false if var2.find_index(char) == nil

        a = var2.find_index(char) 
        var2[a] = ""
    end
    return true if var2.join("").length == 0
    false

end

# p second_anagram?("anagrams", "smargana")


# ----------- PHASE 3 ---------------
# time : O(6n) =  O(n(log(n))
# space : O(n)

def third_anagram?(str1, str2)

    str1.split('').sort.join == str2.split('').sort.join

    
      
end

# p third_anagram?("anagrams", "smargana")



# ------------ PHASE 4 ---------------

# time : O(3n) = O(n) 
# space : O(1)

def fourth_anagram?(str1, str2)
    a = Hash.new(0)

    str1.each_char do |char|
        a[char] += 1    
    end

    str2.each_char do |char|
        a[char] += 1
    end

    a.each do |a,b|
        return false if b % 2 != 0
    end
    true
end

# p fourth_anagram?("anagrams", "smargana")
