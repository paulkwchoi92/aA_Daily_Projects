###terminal notes & visual studios
# visual studios can be used as same text editor as atom. In order to
#run the ruby codes written in visual studios. Simply run terminal by itself or terminal on
# the visual studio. Locate to the directory of the ruby file trying to be run.
# then type.
## ruby "filename"

## syntacitcal preference
# Ruby will always return result implicitly to most recent methdod
# thus it's not necesseary to specify return within a method since it will
# automically return the results implicitly within the method
# ex,
# not prefered
def hello
  return puts "hello"
end
 # preffered
def hello
  puts "hello"
end

puts hello
## using single line
# use single line conditionals when ever possible
# not preferred
if 5 > 1
  puts "hello"
# preferred
puts "Hello" if 5 < 1

# use built in methods as much as possible
# always preferring simpler method to code
# using numerables  to iterate
# less preferred
def repeat_hi(num)
  i = 0
  while i < num
    puts "hi"
    i += 1
  end
end
#preferred
 def repeat_hi(num)
   num.times { puts "hi"}
 end

 # using built in methods over enumerables
 #less preferred
 def all_numbers_even?(nums)
   nums.each do |num|
     return false if num % 2 != 0 # finishing the loop when flase is found
   end
   true # other wise, if all is even, returning true
 end

# preferred
def all_numbers_even?(nums)
  nums.all? { |num| num.even?} # built in method that checks for boolean of all nubmers
end


#### ruby built in methods?

#all?
# its returns true when all elements result in true when passed into the block.
# ex
p [2, 4, 6].all? { |ele| ele.even?} # will be true
p [2, 3, 6].all? { |ele| ele.even?} # will be false

#any?
# return true when all at least one element results in true when paseed into the block.
#ex
p [3, 4, 7].any? { |ele| el.even?} # true since  4 is an even
p [3, 5, 7].any? { |ele| ele.even?} # false since no element is even

#none?
# return true when no elements of result in true when passed into the block.
# ex
p [1 ,3, 5].none? { |ele| ele.even?} # will be true since non is all_numbers_even
p [1, 4, 6].none? { |ele| ele.even?} # will return false since whil it's checking if none of them are even,
#all of them are all_numbers_even
p [1, 4, 5].none? { |ele| ele.even?} #$ will return false since one of even still exists

# one?
# return true when exactly on element results in true when passed into the block
# ex
p [1, 4, 5].one? { |ele| ele.even?} # true since 4 is the only all_numbers_evenp
p [1, 4, 6].one? { |ele| ele.even?} # false since 3 element is even
p [1, 3, 5].one? { |ele| ele.even?} # false because no even element is found

# count
#return a number representing the count of elements that result in true when passed into the block
# ex
p [1, 2, 3, 4, 5, 6].count { |ele| ele.even?} # will resunt in 3 since 2, 4, 6 is true to even?
p [1, 3, 5].count { |ele| ele.event?} #will result in 0 because no element is true to the evne?

#sum
#return the total sum of all elements
p [1, -3, 5].sum  # will result in 3

# max and min on an array
#returns the maximum or minimum of elements
p [1, -3, 5].min # will result in -3
p [1. -3. 5].max # will result in 5
p [].max # will return nil if nothing is presetn

# flatten
# return the 1 dimensional version of multi dimensional array
#ex
multi_d = [
  [["a", "b"], "v"],
  [["d"], ["e"]],
  "f"
]

p multi_d.flatten # will result in ["a", "b", "c", "d", "e", "f"]

##### using documentation lecture
# how to use ruby doc to look up methods and feature available in Ruby
# resource  ruby-doc.org
# search the class object and google what ever method you want to use


#### symbols notes
# symbols are immutable
# while strings and symbols have similar syntax
# strings are mutatable while symobls are not
# the utility of a symbol come from the fact that it can never change over time.
#$ The technical implication of this is that a symbol only needs to be "created"
#once. There is no need to create "copies" of symbol beacuse we can be ceratin
#that it will not change over the course of our programs. Operations such as comparing
# two symbols is very fast and efficient compared to regular strings

# Under the hood, each time we reference a oiteral string. Ruby will allocate a
#piece of our machine's memory to store that string. More memeroy must always
# be allocated for a new string, even if it  is a duplicate value, because strings are mutalbe!
# We msut track changesx to the strings separately, so we need to store
# the two instacnes of the string in disctinct memory locations.

#Talk of memory locations is pretty abstract, but an easy wya to witness this is
#to use Ruby's object_id method. This will return the memory address of some
#data.
# notice how duplicate value strings will be stored at a different memory locations:
# ex.
"hello".object_id # will be 23049230498234
"hello".object_id # will be 23423096309809 even though they look the same

#how ever object id for symbols will always be the same


#### symbols as hash keys
#ex re syntaxing the symbol keys
my_bootcamp = { name: "appacademy", color:"red", locations:["ny", "sf", "online"]}
# how ever when accessing the keys in hashes it must be written in orignal form
# ex
my_bootcamp[:name]


### default arguments
# default arguments are used when some arguments are deemed optional
# ex
def repeat(message, num=1) # num as 1 is the default argument in instances where num param isn't representing
  messsage * num
end

p repeat("hi") # will be result "hi" since default argument is 1
p repeat("hi", 3) # will result in "hihihi"

#We are free to use any default value for an optional arguemnt, so the
#possibilites are endless. A fairly common design pattern is to set an arg
# to nil by default and have logic based on the scenario:
def greet(person_1, person_2=nil)
  if person_2.nil?
    p "hey" + person_1
  else
    p "hey" + person_1 + " and" + person_2
  end
end

greet("cho") # will be "hey cho"
greet("cho", "art") # will be "hey cho and art"

# to avoid confusion, it's best practice to have optional parameters listed after
#the required ones. If we stck to this convention, we can always expect
#arguements top be taken in the same order we pass them in. So avoid
#writing code like this :
# ex
def greet(person_1="default", person_2)
  p person_1 + " and " + person_2
end


### option hashes
# if you have a method that accepts a hash as an arugment, you can omit the
#braces when passing the hash:
# ex
def method(hash)
  p hash
end

method( {"locations"=>"sf", "color"=>"red"})
# can be written as
method("location"=>"sf", "color"=>"red")

#this can really clean things up when you have other arugmetns before the hash:
def modify_string(str, options)
  str.upcase! if options["upper"]
  p str * options["repeats"]
end
# less readable
modify_string("bye", {"upper"=>true, "repeats"=>3}) #will be BYEBYEBYE
# more readable
modify_string("bye", "upper"=>true, "repeats"=>3) # will also result in BYEBYEBYE

##combining option hashes with default can make your code more flexible
def modify_string(str, options={"upper"=>false, "repeats"=>1})
  str.upcase! if options["upper"]
  p str * options["repeats"]
end
modify_string("bye") # willresult in bye  since upper isnt' true due to default being false
modify_string("bye", "upper"=>true, "repeats"=>3) #will result in BYEBYEBYE

### splat operator
# ruby methods are strict in that we must pass the exact number of arguments that a method expects
# tool many will result in error
# ex
def method(arg1, arg2)
  p arg1
  p arg2
end
method("a", "b", "c", "d", "e") # will return wrong numb of arguments error
# if we want our method to have thability to accept at least two arguements
# and potentially more, we can add a splat paramenter. The additional arugemtn will be gather
#into an array for us to use as we see fit:
#ex
def method(arg1, arg2, *otherargs)
  p arg1
  p arg2
  p otherargs
end
method("a", "b", "c", "d", "e") # will result as "a" "b" ["c","d","e"]

#when using a splat argument, if we do not pass in any other additional parameters
# it will result in an empty array

def method(arg1, arg2, *otherargs)
  p arg1 # "a"
  p arg2 # "b"
  p otherargs # []
end
method("a", "b")

# * splt arguments should alwasy go at the end of the paramenter

### Using splat to decompose an array
# splat arguments can be used to decompose or unpack elements of an array.
# if we had an array of elements, but we wanted each individual element to be come and argument
# we can use splat to do so
# ex
def greet(firstn, lastn)
  p "hey" + firstn + ", your last name is " + lastn
end

names = ["grace", "hopper"]
greet(names) # will result in wrong numb of arg error since name  is an array
# can be fixed as
greet(*names) #this will unpack the elements in the names array

## using splat to decompose a hash
# if * before a array will decompose an array, ** before an hash
# will decompose a hash

old_hash = { a: 1, b: 2}
new_hash = { **old_hash, c: 3}
p new_hash # will result in  { a=>1, b=> 2, c=>3}

### inject method
# how to use
# to call on an array and pass on a block, accepts two params;
# the accumulator and the current
# inject will maintain an accum that will change over time
[11, 7, 2, 4].inject { |acc, ele| acc + ele }
# beginning acc will usually be the first elem of the array unless specified
#first iteration
# acc = 11
# ele = 7
# new_acc = 18
#second iteration
# acc = 18
# ele = 2
# new_acc 20
# last iteration
# acc = 20
# ele = 4
# new_acc = 24
# inject will return the final acc
[11, 7, 2, 4].inject { |acc, ele| acc + ele} # will be 24
p [11, 7, 2, 4].inject { |acc, ele| acc * ele} # will be 616
# using inject with conditionals
# ex finding minimum value
p [11, 7, 2, 4].inject do |acc, ele|
  if ele < acc
    ele
  else
    acc
  end
end
# will result in 2
# because while it will iterate through changing the new acc with the elem
#when ele is lower than the acc
# it will ultimately return 2 as the new acc since  4 when the new acc is 2
# is lower than 2 as the new acc
# if there was no else statement, the result will be nil since 4 is higher than
# acc 2


## inject with a default accumulator
[11, 7, 2, 4].inject(100) { |acc, ele| acc + ele }
# first iter
# acc = 100
# ele = 11
# new acc =112
# continued
# will result in 124

## conditional inject with a defautl acc
#ex
[11, 7, 2, 4].inject(0) do |acc, ele|
  if ele.even?
    acc + ele
  else
    acc
  end
end
# else is needed for acc to resultin in nil
# result will be 2, and 4 since only 2 and 4 will be iterated.
