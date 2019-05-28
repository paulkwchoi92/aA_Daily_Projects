## TEST DRIVEN CODING - RSPEC
#TDD Test driven development
#a strategy to devlop programs where the requirements for the program
# is turned into a class

# how to

#1.  Write a new test
#2. Run all tests & check for fail
#  The new tests should fail, if it passes, it should be written
#3. Make changes to modify the tests
#4. Run all tests & check for passes
# if any tests fail, repeat step 3
# if all tests pass but more coverage is needed repeat from test 1
#  COMPLETION of all tests  is iteration of one TDD

# EXAMPLE of TDD with prime? method
# 1st. write a prime? method that checks if numbers if prime
def prime?(numb)
  (2...numb).each do |i|
    if numb % i == 0
      return false
    end
  end
  true
end

# 1 iteration, new tests
prime?(6) # => false
prime?(8) # => false
prime?(9) # => false

## Rspec
# Rspec is automated testing to make testing driven development more convenient
# anatomy of RSPEC
# to use Rspec, files will be sepearted in to /spec file and /lib file
#  example  file tree
#example_project
#    lib
#       prime.rb
#       sum.rb
#    spec
#       prime_spec.rb
#       sum_spec.rb
# files inside spec folders must end in _spec

## How to read specs
# example
# /spec/add_spec.rb

require "add" # this line will include code from "/lib/add.rb"

describe "add method" do
  it "should accept two numbers as arguments" do
    expect { add(2, 3) }.to_not raise_error
  end

  it "should return the sum of the two numbers" do
    expect(add(2, 3)).to eq(5)
    expect(add(10, 12)).to eq(22)
  end
end

# describe names the method being tested
# it names the behavior of the being tested
# expect shows how that behavior is tested 
