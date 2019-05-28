def my_map(arr, &prc)
    new_arr = []
    arr.each { |ele| new_arr << prc.call(ele)}
    new_arr
end

def my_select(arr, &blc)
    new_arr = []

    arr.each { |ele| new_arr << ele if blc.call(ele)}

    new_arr 
end

def my_count(arr, &blc)
   count = 0

    arr.each { |ele| count += 1 if blc.call(ele) }

    count 
end


def my_any?(arr, &blc)
    arr.each do |ele|
        return true if blc.call(ele)
    end
    false
end

def my_all?(arr, &blc)
    arr.each do |ele|
        return false if !blc.call(ele)
    end
    true 
end

def my_none?(arr, &blc)
    arr.each do |ele|
    return false if blc.call(ele)
    end 
    true
end