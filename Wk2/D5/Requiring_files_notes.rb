#### how can be organized into files
# ex of code

# pet_hotel.rb

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

class Cat
  def initialize(name)
    @name = name
  end
end

hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

hotel.check_in(cat_1)
hotel.check_in(cat_2)

p hotel

# above is accpetable, but  what if our PEtHotel and Cat classes were more complex?
# Grouping these two classes inthe same file may no longer be viable. Even further,
# what if our PetHotel should be able to house other animals like dog, birds etc?
# We should avoid creating one massive file for all of thi classes and logic.
# A great design pricniple to follow is Separation of Concerns. One file should foucs
# on implemting one class. After all, our Cat class shoudl be albe to stand on it's own
# wihtout interaction from PetHotel to increase resuability of our classes


## a better hotel desing
# below is one way we could organize our different files. project_root i s our outermost
#folder that will contain everything. Names that end in  .rb are files, names that don't
# end in .rb are folders

project_root
  ├── pet_hotel.rb
  ├── cat.rb
  └── other_animals
      └── dog.rb


#However, if PetHotel and cat exist in separate files, how can we connect the two?
# We need to "import" cat.rb into pet_hotel.rb. In other words, we need to require
# cat.rb in pet_hotel.rb. Let's take a look into how we can do this along with dog.rb,
# using the require_relative method next.


### Require relative
# keep in mind the fold structure above and take a look at the code we could have
# in each file:

# project_root/cat.rb
class Cat
  def initialize(name)
    @name = name
  end
end

# project_root/other_animals/dog.rb
class Dog
  def initialize(name)
    @name = name
  end
end

# project_root/pet_hotel.rb

# Let's require the last two files, by specifying their path's relative to this pet_hotel.rb file
require_relative "./cat.rb"
require_relative "./other_animals/dog.rb"

class PetHotel
  def initialize(name)
    @name = name
    @guests = []
  end

  def check_in(guest)
    @guests << guest
  end
end

hotel = PetHotel.new("Animal Inn")

cat = Cat.new("Sennacy")
dog = Dog.new("Fido")

hotel.check_in(cat)
hotel.check_in(dog)

p hotel


## to run our hotel, we would jsut need to execute ruby pet_hotel.rb.
#Becase pet_htoel.rb requires cat.rb and dog.rb, the code in those files
#will also execute

# require_relative is a method we can use to speicfy a path to another ruby file.
# As it's name suggest, we need to specify a path that is relative to our current location.
# So if we are at pet_hotel.rb a relative path to cat.rb is ./cat.rb.
# a single dot (./) denotes the current location of our file


# dog.rb is not immediately foudn in our current lcoaiton; its is one folder away.
#So the relative path from pet_hotel.rb to dog.rb is
# ./other_animals/dog.#!/usr/bin/env ruby -wKU


### Require vs require_relative
# you may have noticed that in the course proejcts we have used #require
# instead of #require_relative in our /spec files. We use the plain requrie
# because we run the code using RSPEC via vundle esec rspec.
# RSPEC will automatically run the cod ein a certain configuration where it will
#automatically know to lok inside of the /lib folder. In fact, RSPEC is designed
#to be used where tyou have a spearte /spec and /lib folders. To get into the nitty
#gritty details, RSPEC will configure the %LOAD_APTH for us.
# but don't worry about htis for now.


## as a rule of thum, we'll use th e plain require where gems are involves.
#In the previouse sectiions that used the byebug gem, we had to write require "byebug"
# to accesss the debugger. It's obvious that we don't have an explict byebug.rb file in
#those old projects. This is becaseu ruby aready know where to find bybebug through
#LOADPATH
