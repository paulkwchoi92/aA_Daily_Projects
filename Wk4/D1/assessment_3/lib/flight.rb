class Flight
    attr_reader :passengers

def initialize(f_num, cap)
    @flight_number = f_num
    @capacity = cap
    @passengers = []
end

def full?
    if @passengers.length == @capacity
        return true
    else
        return false
    end
end

def board_passenger(passenger)
    if passenger.has_flight?(@flight_number) && self.full? == false
        @passengers << passenger
    end
end

def list_passengers
    list = []
    @passengers.each do |ele|
        list << ele.name 
    end
    list
end

def [](idx)
    @passengers[idx]
end

def <<(passenger)
    board_passenger(passenger)
end

end
