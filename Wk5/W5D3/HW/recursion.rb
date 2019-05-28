def sum_to(num)
  return nil if num < 0
  return 1 if num <= 1
  num + sum_to(num - 1)
end

# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil


def add_numbers(nums_array)
  return nil if nums_array.empty?
  return nums_array[0] if nums_array.length == 1

  nums_array[0] + add_numbers(nums_array[1..-1])
end
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil


def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1
  (n-1) * gamma_fnc(n-1)
end

p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns
p gamma_fnc(4)  # => returns 6
p gamma_fnc(8)  # => returns 5040


def ice_cream_shop(a,str)
  return false if a.length == 0
  return true if a[0] == str
  ice_cream_shop(a[1..-1],str)

end

# puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  == false
# puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea') == true
# puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  == false
# puts ice_cream_shop(['moose tracks'], 'moose tracks')  == true
# puts ice_cream_shop([], 'honey lavender') ==  false

def reverse(str)
  return "" if str.length == 0
  str[-1] + reverse(str[0..-2])
end

# puts reverse("house") == "esuoh"
# puts reverse("dog") == "god"
# puts reverse("atom") == "mota"
# puts reverse("q") == "q"
# puts reverse("id") == "di"
# puts reverse("") == ""
