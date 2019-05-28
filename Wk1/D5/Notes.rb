### using Pry
# step 1
# type in pry in your command line
# usaing ls to search methods that can be used on a given context
# ex
# ls String
# will return a load of commands that we can use on a String

#using show-doc
#show-doc can be used to show a documnetation summary for a given method
#ex,
#if you want to learn about end_with?
# we can syntax it as following to read up on end_with?
#"show-doc String#end_with?"
# this will output the following
# From: string.c (C Method):
# Owner: String
# Visibility: public
# Signature: end_with?(*arg1)
# Number of lines: 7
#
# Returns true if str ends with one of the suffixes given.
#
#   "hello".end_with?("ello")               #=> true
#
#   # returns true if one of the suffixes matches.
#   "hello".end_with?("heaven", "ello")     #=> true
#   "hello".end_with?("heaven", "paradise") #=> false


## load
#not a Pry specific command, but it is useful when you want to bring an entire
#files worht or Ruby code into your Pry session
#
# /Desktop/my_ruby_code$ ls
# code.rb
#
# ~/Desktop/my_ruby_code$ cat code.rb
# def is_prime?(num)
#   (2...num).each do |factor|
#     return false if num % factor == 0
#   end
#
#   num > 1
# end
#
# ~/Desktop/my_ruby_code$ pry
# [1] pry(main)> load "code.rb"
# => true
# [2] pry(main)> is_prime?(16)
# => false
# [3] pry(main)> is_prime?(7)
# => true
# [4] pry(main)>


## show-source
# if we want to see the code that implements a method, we call this the source code
# in case where a definiton for method is copy and pasted, we can use following syntax to see where it's From#
# "show-source is_prim?""
# ex
# [5] pry(main)> show-source is_prime?
#
# From: (pry) @ line 1:
# Owner: Object
# Visibility: public
# Number of lines: 7
#
# def is_prime?(num)
#   (2...num).each do |factor|
#     return false if num % factor == 0
#   end
#
#   num > 1
# end


# Using Byebug

##Using Byebug

#ByeBug cheatsheet
#  -before running your file
#    "require "byebug"" - add to the top of your file to gain access to the gem
#    "debugger" - place this line at a point in your file where you want to begin debugger mode
#  -while in debugger mode
# "l <start line>-<end line>"" - list the line numbers in the specified range
#     example: l 3-20
# "step" or "s" - step into the method call on the current line, if possible
# "next" or "n" - move to the next line of executed code
# "break <line num>"" or "b <line num>"" - place a breakpoint at the specified line number, this will pause execution again
# "continue" or "c" - resume normal execution of the code until a breakpoint
# "display <variable>" - automatically show the current value of a variable

#running bye bug

# After installing byebug, you'll have to add a few lines of
# code to your .rb file to begin using it. We'll first need to require "byebug" to
#   gain access to the gem. Then, we can add a debugger line to pause execution of our
#  code and hop into debugging mode. Let's set up some first_n_primes code to use the debugger.
#  There are no bugs in the following code to be found, instead we'll focus on learning the
#  mechanics of byebug. We'll also number the lines as byebug would:

# [10, 19] in /Users/appacademy/Desktop/lecture/code.rb
#    10:
#    11: def first_n_primes(num_primes)
#    12:   primes = []
#    13:   num = 2
#    14:   debugger
# => 15:   while primes.length < num_primes
#    16:     primes << num if is_prime?(num)
#    17:     num += 1
#    18:   end
#    19:   primes
# (byebug)


## From here we can check the current value of a variable by simply referencing it's name
# ...
# (byebug) primes
# []
# (byebug) num
# 2

#### Display

#we can use "display" command to automatically  set up tracking for variables
# [10, 19] in /Users/appacademy/Desktop/lecture/code.rb
#    10:
#    11: def first_n_primes(num_primes)
#    12:   primes = []
#    13:   num = 2
#    14:   debugger
# => 15:   while primes.length < num_primes
#    16:     primes << num if is_prime?(num)
#    17:     num += 1
#    18:   end
#    19:   primes
# (byebug) display primes
# 1: primes = []
# (byebug) display num
# 2: num = 2

### next command,
# once debugger has started next command can be used to execute the next code in the iteration
# not necessarily the next line

### step
#You may have noticed that using next will not bring us into the evaluation of
#is_prime?(num) (line 16). Once execution is paused on a line containing a method
#call, we can use the step command to step into that method. Picking up on the
#iteration where we left off, let's step into line 16's call.

### Break and Continue
# Let's say we are done with the bulk of our debugging and we want to fast forward
#  to a much later point of the execution. Instead of mashing the next command
#  barbarically (bugs test the best of us), you can use break <line num> to set a
#  future breakpoint in the code. Setting a breakpoint in the code will mark a line
#  that we want to pause and reenter debugging mode on. We can then use the continue
#  to resume normal execution until we hit the breakpoint! Let's set up a breakpoint
#  on the return statement for first_n_primes (line 19) and then continue:
