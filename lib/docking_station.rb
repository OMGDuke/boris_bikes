require_relative 'Bike'
class DockingStation

DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
	  @capacity = capacity 
	  @bikes = []
	end

	attr_reader :capacity 

  def release_bike
    raise "No bike available" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "The docking station is full" if full?
    @bikes << bike
  end

  def list_bikes
  	bikes
  end

private

attr_reader :bikes

  def full?
  	@bikes.count >= @capacity
  	end
  def empty?
  	@bikes.count == 0
    end
end
