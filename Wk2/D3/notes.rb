##  Classes
# as a programmer, you'll often want to model some object and the properties
#of the object, For example, a social media site may need to mdoel a user with their
#user name and a profiel picture. Or perhaps a  music site may need to model a song
#with it's title, genre, and duration. Following App Academy tradition,
#let's say we wanted to model some Cats in ruby! our cats! will have name, colors, and age

# ex of repeated functions
cat_1 = {name: "Sennacy", color: "brown", age: 3}
cat_2 = {name: "Whiskers", color: "white", age: 5}
cat_3 = {name: "Garfield", color: "orange", age: 7}

# how it can be fixed

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end
end

#three important things about the code above
# * to create a class we use the class keyword
# * the name of a class must begin with a capital letter
#we can define methods within a class

# the #initialize method is a special method name that we will use when creating cats.
# the method expects 3 parameter, name, color, and age
# @ in front of those 3 params make it an instance variable


### initializing new cats

cat_1 = Cat.new("Sennacy", "brown", 3)
cat_2 = Cat.new("Whiskers", "white", 5)

# to create a new cat, #new method must be called on a Cat class,
#this means # new method calls upon # initialize method

## get_name method

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def get_name
    @name
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1.get_name # "Sennacy"

# get_.name has to be called on the instance of the variable not the class it self
# the method is used to get the local variable set for the class
# it can be smplified as followed for more options

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def name
    @name
  end

  def age
    @age
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1.name  # "Sennacy"
p cat_1.age   # 3

cat_2 = Cat.new("Whiskers", "white", 5)
p cat_2.name  # "Whiskers"
p cat_2.age   # 5

p cat_2.color # This will give NoMethodError: undefined method `color'

# getter methods cannot be used to change the value of a certain variable

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def name
    @name
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1.name          # "Sennacy"
cat_1.name = "Kitty"  # This will give NoMethodError: undefined method `name='

# writing the setter method # note that only the block of code inside is method
#is more important than the one outside

class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  # getter
  def age
    @age
  end

  # setter
  def age=(number)
    @age = number
  end
end

cat_1 = Cat.new("Sennacy", "brown", 3)
p cat_1 #<Cat:0x007f8511a6f340 @age=3, @color="brown", @name="Sennacy">
cat_1.age = 42
p cat_1 #<Cat:0x007f8511a6f340 @age=42, @color="brown", @name="Sennacy">
# space between parantheis and equal sign can be omitted as well as the paranthesis


###--------- beyond getter and setter


class Cat
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  def purr
    if @age > 5
      puts @name.upcase + " goes purrrrrr..."
    else
      puts "..."
    end
  end
end

cat_1 = Cat.new("Sennacy", "brown", 10)
cat_1.purr  # "SENNACY goes purrrrrr..."

cat_2 = Cat.new("Whiskers", "white", 3)
cat_2.purr  # "..."


### ----------- instance versus class variables
# as seen in the previous, instance varialbes or attributes are denoted with @
# and they are typically assigned to the initialize method

# class variables are denoted with two @
# ex
class Car
  @@num_wheels = 4 ## class variable accessible and attributed equally for
  # any creation of Car

  def initialize(color)
    @color = color
  end

  # getter for @color instance variable
  def color
    @color
  end

  # getter for @@num_wheels class variable
  def num_wheels
    @@num_wheels
  end
end

car_1 = Car.new("red")
p car_1.num_wheels    # 4

car_2 = Car.new("black")
p car_2.num_wheels    # 4

# this means that when initializoing a car object,
# only the color will need to be defined, and the number of wheel will be
#already set to the shared class varialbe

# this means that if the class varialb is changed to a different value
#all instances where the class variables are shared will also change
# ex.

class Car
  @@num_wheels = 4

  def self.upgrade_to_flying_cars
    @@num_wheels = 0
  end

  def initialize(color)
    @color = color
  end

  def num_wheels
    @@num_wheels
  end
end

car_1 = Car.new("red")
car_2 = Car.new("black")

p car_1.num_wheels    # 4
p car_2.num_wheels    # 4

Car.upgrade_to_flying_cars

p car_1.num_wheels    # 0
p car_2.num_wheels    # 0

car_3 = Car.new("silver")
p car_3.num_wheels    # 0


### ----- class constants
# class constants are created when you want a certain variable not to be altered
# ex

class Car
  NUM_WHEELS = 4

  def self.upgrade_to_flying_cars
    NUM_WHEELS = 0    # SyntaxError: dynamic constant assignment
  end

  def initialize(color)
    @color = color
  end

  def num_wheels
    NUM_WHEELS
  end
end


car_1 = Car.new("red")
car_2 = Car.new("black")

p car_1.num_wheels    # 4
p car_2.num_wheels    # 4

Car.upgrade_to_flying_cars

summary

# instance variable will be varaiable distinct in each instances of the class

## class varialbes will be shared amongst all instances of the class,
# changing this variable will result in change of all instances sharing this variable


##CLASS_CONSTANT will be shared amongst all class but cannot be changed.


##### -------------- Instance methods and class methods

## **** Instance methods are methods that are called on instances of class

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def speak # this is an instance method that is called on an instance of a class
    @name + " says " + @bark
  end
end

my_dog = Dog.new("Fido", "woof")
my_dog.speak          # "Fido says woof"

other_dog = Dog.new("Doge", "much bork")
other_dog.speak       # "Doge says much bork"

# speak will be called on an instance made using Dog.new method

#Remember that if something is an instance of Dog, it is an object with a @name
#and @bark. Since my_dog and other_dog are instances, when we call speak on them
#respectively, we can get different behavior because they can have different @name
#and @bark values. An instance method depends on the attributes or instance
#variables of an instance.

##### --- Class methods

# class methods are usually called on #self when creating
# this refers to the Class it belongs to
# ex.

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def self.growl # class method
    "Grrrrr"
  end
end

Dog.growl   # Grrrrr

#Since growl is a class method, we cannot call it on an instance; instead
#we call it on the Dog class directly . A class method cannot refer to any instance
# attributes like @name and @bark! As programmers, we'll choose to build class
#methods for added utility.

# another use of class method

class Dog
  def initialize(name, bark)
    @name = name
    @bark = bark
  end

  def self.whos_louder(dog_1, dog_2) # this compares the two instance variable of the instances of dogs
    if dog_1.bark.length > dog_2.bark.length
      return dog_1.name
    elsif dog_1.bark.length < dog_2.bark.length
      return dog_2.name
    else
      return nil
    end
  end

  def name
    @name
  end

  def bark
    @bark
  end
end


## summar
#Class#method_name means method_name is an instance method
#Class::method_name means method_name is a class method
