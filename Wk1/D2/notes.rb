## Introduction to sorting algorithms

# bubble sort
# sorting elements through analyzing two elems at a time to see if they
#are in correct low to high order

def bubble_sort2(arr)
  sorted = false # inittiazing loop
  until sorted
    sorted = true # end of loop if conditions are met
    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1] # condition for the loop checking if the array is sorted
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted =false # reflipping the loop to restart the loop
      end
    end
  end

  arr
end

def bubble_sort(arr)
    sorted = false
    until sorted
        (0...arr.length - 1).each do |i|
            if arr[i] > arr[i + 1]
                arr[i], arr[i + 1] = arr[i + 1], arr[i]

                sorted =false
            end
        end
    end
    arr
end

ab1 = [3, 1, 5, 7, 6]
p bubble_sort(ab1)


## scope notes
# scope describes the location in your program where a variable is accessible


### Methods and local scope

# lexical scope
# lexical scope ddescribes how a variable name evaluates in nested code.
# ex
def say_hello
  message = "hello"
  p message
end
say_hello

# method say_hello has it's own scope where to variable message is defined
# say_hello method is a local scope
# thus we cannot use the variable message outside of the scope of say_hello
# if any variable exists out side of the say_hello scope say_hello cannot
# call the variable as well

## globa variables
# global variables are variable that can be accessed by any scopes
# syntax of global variable is used through putting $ infront of the variable
# ex

$message2 = "bye "
# this variable can be accessed any where by any method or by any occasion

## constants
# a constant variable is a value that cannot be reassigned
# syntax is used by beginning the letter with a capital letter
# ex
Pho = "food"
# this variable cannot be reassigned and will be constant
# constant can be mutates in its form  but it cannot be reassigned
#thus
Pho[0] = "F"
# will change the constant to
Pho = "Food" # mutation methods can be used on Constants
# note that it has only been mutated but not reassgiend
# constant exist in glboal scope
# blocks and loops do not have their own scope

### variable reference lecture
# variables will always have a different location under the hood
# what this means is that even if the value of two variables are the same
# the two variables will not have the same location
# ex
word_1 = "boot"
word_2 = "boot"
# will have differnet location
# how ever, if another variable is used point towards a value of another variable
# the two variable will have the same location(location id)
# ex
word_3 = "boot "
word_4 = word_3
# will have the same value with smae locaiton
# any change made to word_3 will show in word_4

## affect on location memory address, no effect on variable mutation
# object id  is still an address of memory location
# however, reassigning the variable will make it point to a differnet location

## array method
#creating a multiple deafult valued length of array
#es
arr = Array.new(10, 2) # 10 will be length 2 will be default value
arr = Array.new(3, [])
arr = Array.new(3, Array.new(3)) # x 3 grid
arr[0][0]  # will change all 0 of sub arrays
# this bug happens because the sub arrays were "referenced to a locatio" as
# one location with "array.new(3)" inside the first arry.new

#how to fix this by creating many unique arrays
#ex
grid = Array.new(3) {Array.new(3)} # this syntax will create 3 different sub arrays
#with different reference locations
