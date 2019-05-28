def partition(arr, num)
    arr1=[]
    arr2=[]
    arr.each do |ele|
        arr1 << ele if ele < num
        arr2 << ele if ele >= num
    end
    [arr1, arr2]
end

def merge(hash1, hash2)
  new_hash = {}
  hash1.each do |k, v|
    new_hash[k] = v
  end
  hash2.each do |k, v|
    if new_hash.has_key?(k)
        new_hash[k] = v
    else
        new_hash[k] =v
    end
end
new_hash
end

def censor(str, arr)
    ans = str.split(" ")
    ans2 = []
    vowels = "aeiouAEIOU"
    ans.each do |ele|
        check = ele.downcase
        if arr.include?(check)
            new_word = ""
            ele.each_char do |char|
                if vowels.include?(char)
                    new_word << "*"
                else
                    new_word << char
                end
            end
            ans2 << new_word
        else
            ans2 << ele
        end
    end
    ans2.join(" ")

    
end 

def power_of_two?(num)
    ans = 1

    while ans < num
       ans *= 2
    end

    ans == num

end