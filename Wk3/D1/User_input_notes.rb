#### USER INPUT

# so fare in the course we have only written code that executes wihtout any input
#from a user. In order to amke our programs interactive, we'll need to learn how to allow
#the user to interact through thier keyboard

## Getting input

#the build in method we'll use to allow a user to vive inputs is #gets. The #gets
# method is unique in that when it is called, it will halt execution of the code and allow
# the use to type characters until they rpess enter on their keyboard. Once enter is hit,
# the #gets method will return a string containing the user's keystrokes.
# Ex

p "Enter your name:"
name = gets
p "hello" + name


###--- Dealing with New Lines

# when using #gets, the string returned represetn the keys typed by the user.
#However, since the user presses enter to end their input, this will add a new line
#character at the end of the string. \n is how we represetn the new line character in programming.
# You;'ll noticed that every stinrg returned from gets will end in \n as a reulst of this.
#We should be very aware of this extra character when using gets
# heres a common mistake ex.

puts "Enter 'yes' or 'no'"

response = gets
if response == "yes"
  put "yup!"
elsif response == "no"
  puts "nah!"
else
  puts "I'm sorry, my response are limited."
end

# As this codes stands, if the user enters a vlaid response of yes, the conditional
#would not be able to catch this. This is because gets will really return
# "yes\n". "yes is not equal to "yes\n", bummer


###===== Chomping New Lines

# to fix the issue in the previous code, we can use a string method, chomp to
#remove all newwlines chars (\n) at the end of astring  buy returning a new string.
# Not that comp is just plain string methdo.

#ex
my_string = "yes\n"
p my_string.chomp # will result in "yes"

#since gets returns a string, lets' chomp it in our old example. Here is the correct code:
#ex

puts "Enter 'yes' or 'no'"

response = gets.chomp
if response == "yes"
  puts "yup!"
elsif response == "no"
  puts "nah!"
else
  puts "I'm sorry, my responses are limited."
end


### Getting numbers

#another common mistake happnes when we try to get number input from the user .


puts "Enter a number: "
num = gets.chomp
puts 2 * num      #TypeError: String can't be coerced into Integer

#When the user enters a "number", the code will get an error because gets
#will alwasy return string of characters. SO if the user intnded to enter the
#number 42, num woul realluy be the string "42

numeric_string = "42"
p numeric_string      # "42"
p numeric_string.to_i # 42
"
