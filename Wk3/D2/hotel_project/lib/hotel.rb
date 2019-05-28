require_relative "room"

class Hotel
  def initialize(name, capacities)
    @name = name
    @rooms = {}

    capacities.each do |k, v| 
        @rooms[k] = Room.new(v) #Room initiate accepts capacity
    end
  end

  def name
    ans = []
    @name.split(" ").each do |ele|
        ans << ele.capitalize
    end
    ans.join(" ")
  end

  def rooms
    @rooms 
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
        if @rooms[room_name].add_occupant(person)
            print "check in successful"
        else
            print "sorry, room is full"
        end
    else
        print "sorry, room does not exist"
    end
  end

  def has_vacancy?
     @rooms.values.any? { |room| room.available_space > 0}
  end

  def list_rooms
    @rooms.each { |k, v| puts "#{k} " + "#{v.available_space}" }
  end 



end
