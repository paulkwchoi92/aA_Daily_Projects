def no_dupes?(arr)
    new_arr = []
    arr.each { |ele| new_arr << ele if arr.count(ele) < 2}
     new_arr

end

# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []

#---------

def no_consecutive_repeats?(arr)
  arr.each_with_index do |ele, idx|
    og = arr[idx]
    comp = arr[idx + 1]
    return false if og == comp
  end

  return true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

#---------

def char_indices(str)
  ans = Hash.new { |h, k| h[k] = []} # using Hash.new([]) will give one location of arr rather than uniqe locations of arrs
  str.each_char.with_index do |char, idx|
    ans[char] << idx
  end
  ans
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
#---------

# method of approach: i want to approach this problem with character count,
# i would want an empty arr to shovel char with it's count as [char, count]
# as i iterate through the chars, in order to prevent redundant entries i would check
# if the arra im inputting to already has the char.
#after i get an arr i would set a emptry "ans" string that will vary as I iterate through the new arr.
# i will compare the counts of the elements of the arr with the length of the string
# because we need to return the later occurance of the longest streaks, i will replace the ans
# with count multiplied by the char if the count is equal or greater than length of the "ans" str
#

def longest_streak(str)

  arr  = []
   split.each do |char|
     if !arr.include?([char, split.count(char)])
     arr << [char, split.count(char)]
     end
    end
    ans = ""
   arr.each do |ele|
     if ele[1] > ans.length || ele[1] == ans.length
       ans = "#{ele[0] * ele[1]}"
     end
   end
   ans

end


 # p longest_streak('a')           # => 'a'
 # p longest_streak('accccbbb')    # => 'cccc'
 # p longest_streak('aaaxyyyyyzz') # => yyyyy
 # p longest_streak('aaabbb')      # => 'bbb'
 # p longest_streak('abc')        # => 'c'

 #---------
 # approach: i would first get set an empty array which will be used for
 # shoveling in factors. in order to sovel in factors i will use a % method
 # if any number between num % 1..num is 0. it will be that number and num / number
 # and i will iterate through each ele in the arr if any of them is both prime
 # and if true is returned with the any method i will include a implicit false


def bi_prime?(num)
  require 'prime' # prime needs to be required in order to use prime? method
   arr = []
   (1..num).each do |i|
     arr << [i, (num / i)] if num % i == 0
   end

   arr.each do |ele|
      return true if ele.all? { |i2| Prime.prime?(i2)}

   end
   false

end

#  p bi_prime?(14)   # => true
# p  bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

#------

# for this method i will iterate through the the str using 0 to str length
# at the same time i will iterate through the keys constantly iterate through
# the keys using modulo based on the length of the keys that will evaluate
# to 0 to last indices of the keys since every time a number fills up to the
# legnth of the keys it will go back to 0

def vigenere_cipher(str, arr)
  alpha = ("a".."z").to_a
  i = 0
   j = 0
  while i < str.length

      old_index = alpha.index(str[i])
      new_index = (old_index + arr[j]) % 26
      str[i] = alpha[new_index]
      j = (j+1)%arr.length


      i += 1
  end
  str
end
#---------



# p vigenere_cipher("toerrishuman", [1])       # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# vigenere_cipher("yawn", [5, 1])             # => "dbbo"
#----------
# for this method i will use select method to check the indices of the vowels
# in the given string. the indicies of the str will be assigned into a new array
# where the array will then  rotated into another variable for length amount of times
# to shift every vowel to the left. After wards i will use the indicies of the original array
# to assign values occuring at the new array indices on the string.

def vowel_rotate(str)
  vowels = ('aeiou')
  arr1 = (0...str.length).select { |i| vowels.include?(str[i]) }
  arr2 = arr1.rotate(-1)
  arr3 = arr2.map { |i| str[i]}
  (0...arr1.length).each do |i|
    prev_idx = arr1[i]
    str[prev_idx] = arr3[i]
  end
  str
 end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# vowel_rotate('headphones')    # => "heedphanos"
# vowel_rotate('bootcamp')      # => "baotcomp"
# vowel_rotate('awesome')       # => "ewasemo"

class String

  def select(&prc)
    return "" if prc == nil
   new_str = ""
   self.each_char do |char| new_str += char if prc.call(char)
   end
   new_str
 end

 def map!(&prc)
   self.each_char.with_index do |char, i|
     self[i] = prc.call(char, i)
   end

 end


end

#  p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch|
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"
#
# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(num1, num2)
  return 0 if num2 == 0
  if num2 > 0
  num1 + multiply(num1, num2 - 1)
elsif num1 < 0 || num2 < 0
    (-num1)  + multiply(num1, num2 + 1)

  end
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
  return [] if num == 0
  return [2] if num == 1
  return [2, 1] if num == 2
  lucas_sequence(num - 1) + [lucas_sequence(num - 1)[-1] + lucas_sequence(num - 1)[-2]]
  # num - 1 will return the most recent arr and the later sequence will return the sum of last two indicie
  # of the recent arr
end


# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
  (2...num).each do |i|
    if num % i == 0
      i2 = num / i
      return [ *prime_factorization(i) , *prime_factorization(i2) ]
    end
  end
  [num] # implict return if no number divides into the i1 and i2
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
