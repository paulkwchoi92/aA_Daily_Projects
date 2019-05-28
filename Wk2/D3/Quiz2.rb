def greatest_common_factor(numbers)
    i = numbers.sort.last
    i.downto(1) do |i|
       return i if numbers.all? { |ele| ele % i == 0 }
       end
end
