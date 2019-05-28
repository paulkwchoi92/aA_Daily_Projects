def reverser(str, &blc)
    str2 = str.reverse
    blc.call(str2)
end

def word_changer(str, &blc)
    new_sent = []
    str.split(" ").each { |ele| new_sent << blc.call(ele) }
    new_sent.join(" ") 
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each { |ele| new_arr << ele if prc1.call(ele) && prc2.call(ele)}
    new_arr 
end 

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |ele, idx|
        if idx % 2 == 0
            new_arr << prc1.call(ele)
        else
            new_arr << prc2.call(ele)
        end
    end
    new_arr
end
