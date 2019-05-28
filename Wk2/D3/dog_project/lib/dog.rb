class Dog
   def initialize(name, breed, age, bark, favorite_foods)
    @name = name 
    @breed = breed 
    @age = age 
    @bark = bark
    @favorite_foods = favorite_foods
   end 

   def name 
    @name
   end 
   
   def breed
    @breed
   end

   def age
    @age
   end 

   def age=(number)
    @age = number
   end 

   def bark
    if @age > 3
        @bark.upcase
    elsif @age <= 3
        @bark.downcase
    end
   end

   def favorite_foods
    @favorite_foods
   end

   def favorite_food?(str)
    a1 = @favorite_foods.map { |ele| ele.downcase}

     a1.include?(str.downcase)
   end

   ## appacdemy answer 
   # def favorite_food?(str)
    #@favorite_foods.map(&:downcase).include?(str.downcase)
   #end

end
