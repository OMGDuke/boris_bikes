require_relative 'bike'
require_relative 'docking_station'

class Van
  attr_reader :capacity, :bikes, :location

  DEFAULT_CAPACITY = 5

  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes = []
    @location = "Garage"
  end

  def accept(bike)
    if bike.length > @capacity
      raise "This van can only carry 5 bikes"
    else
      @bikes.push(*bike)
      @bikes
    end
  end

  def release_bike
      @bikes.pop(bikes.length)
  end

  def travel
    @location == "Garage" ? @location = "Docking Station" : @location = "Garage"
  end

end
