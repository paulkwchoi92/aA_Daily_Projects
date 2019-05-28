def my_reject(arr, &blc)
    new_arr = [] 
    arr.each{ |ele| new_arr << ele if !blc.call(ele) }
    new_arr 
end

def my_one?(arr, &blc)
    count = 0
    arr.each { |ele| count += 1 if blc.call(ele)}
    if count == 1
        return true
    else
        false
    end
end

def hash_select(hash, &blc)
    ans = {}
    hash.each { |k, v| ans[k] = v if blc.call(k, v)}
    ans
end

def xor_select(arr, prc1, prc2)
    ans = [] 
    arr.each do |ele|
        ans << ele if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
    end
    ans 
end

def proc_count(v, arr)
    count = 0
    arr.each { |ele| count += 1 if ele.call(v) }
        count

end