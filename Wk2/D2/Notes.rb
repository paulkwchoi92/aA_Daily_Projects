### Procs
# Proc is an object that coontains a block.
# they allow us to save blocks to varialbes so we can manipulate thme in our code

# creating proc
# Proc.new syntax
# correct
doubler = Proc.new { |num| num * 2 }
p doubler # #<Proc:0x00007f9a8b36b0c8>
# incorrect
doubler = { |num| num * 2 } # SyntaxError: unexpected '}'

## Calling a proc
#proc#call  method
doubler = Proc.new { |num| num * 2 }
p doubler.call(5) # => 10
p doubler.call(7) # => 14

# when calling the proc, we can pass in any arguments the block expects
# we can also call teh proc as many time as we please
# the proc#call method will evalute to the last line of code executed within the block
# This is what it will look like in a multi line proc

is_even = Proc.new do |num|
  if num % 2 == 0
    true
  else
    false
  end
end

p is_even.call(12) # => true

#passing a proc to a method
# since a proc has an adavantage of being an object, it can be passed into a method
# ex
def add_and_proc(num_1, num_2, prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

# this method will add the two nums call desired prc onto the sum
def add_and_proc(num_1, num_2, prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # => 10

square = Proc.new { |num| num * num }
add_and_proc(3, 6, square)    # => 81

negate = Proc.new { |num| -1 * num }
add_and_proc(3, 6, negate)    # => -9

## easier way to make the abuve two lines into a one liner

# Version 1: manual, proc accepting method
def add_and_proc(num_1, num_2, prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

doubler = Proc.new { |num| num * 2 }
add_and_proc(1, 4, doubler)   # => 10


# Version 2: automatic conversion from block to proc
def add_and_proc(num_1, num_2, &prc)
  sum = num_1 + num_2
  p prc.call(sum)
end

add_and_proc(1, 4) { |num| num * 2 }  # => 10


## noting the difference of what must be passed

def my_method(prc)
  # ...
end

# By looking at the parameter `prc` we know that my_method must be passed a proc:
my_proc = Proc.new { "I'm a block" }
my_method(my_proc)


def my_method(&prc)
  # ...
end

# By looking at the parameter `&prc` we know that my_method must be passed a block,
# because & denotes conversion from block to proc here:
my_method { "I'm a block" }

# if a block needs to be passed into a method, we can use & infront of the proc to turn it into a block

#Another Example
# The dual function of & is the biggest point of confusion for blocks and procs so
# let's step through another example in familiar territory. We know that map is a built-in
# method that must be given a block:

[1,2,3].map { |num| num * 2 } # => [2, 4, 6]
However, if we have a proc and want to use it with map, we can use & to convert it to a block:

doubler = Proc.new { |num| num * 2 }
[1,2,3].map(&doubler) # => [2, 4, 6]


------------ Lecture

# procs can be constantly reused

def add_and_proc(num1, num2, prc)
  sum = num1 + num2
  prc.call(sum)
end

doubler = Proc.new { |n| 2 * n}
p add_and_proc(2, 3, doubler)


# one liner proc call on a method

def add_and_proc(num1, num2, &proc)
  sum = num1 + num2
 proc.call(sum)
end

negate = Proc.new { |n| -1 * n}

if you want to pass in a proc as a block, put a & infront of the procs

  p add_and_proc(2, 3, &negate) will conver negate in to the block


## monkey patching map with proc call

def my_map(arr, &prc)
  new_arr = []
  arr.each { |ele| new_arr << prc.call(ele)}

  new_arr
end
