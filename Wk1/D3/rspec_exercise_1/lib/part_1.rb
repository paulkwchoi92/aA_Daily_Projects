def average(num1, num2)
    if (num1 + num2) % 2 != 0
        (num1 + num2) / 2.0
    else
        (num1 + num2) / 2
    end
end

def average_array(arr)
    sum = arr.inject {|acc, ele| acc + ele }
    if sum % arr.length != 0
        sum / arr.length.to_f
    else
        sum / arr.length
    end

end

def repeat(str, num)
   if num == 0
     ""
   else
    new_str = str * num
    new_str 
   end

end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    arr = str.downcase.split(" ")
    ans = []
    (0...arr.length).each do |i|
        if i == 0 || i.even?
            ans << arr[i].upcase
        else
            ans << arr[i]
        end
    end
            
    ans.join(" ")
end