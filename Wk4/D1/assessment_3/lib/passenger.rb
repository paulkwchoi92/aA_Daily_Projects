class Passenger
    attr_reader :name

def initialize(name)
    @name = name 
    @flight_numbers = []
end

def has_flight?(f_num)
    if @flight_numbers.include?(f_num.upcase)
        return true
    else
        return false
    end
end

def add_flight(f_num)
    if has_flight?(f_num) == false 
        @flight_numbers << f_num.upcase
    end
end



end