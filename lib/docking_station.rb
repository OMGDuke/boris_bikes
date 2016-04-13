require_relative 'Bike'
class DockingStation
	def initialize
	  @bikes = []
	end
	attr_reader :bikes

	DEFAULT_CAPACITY = 20

  def release_bike
    raise "No bike available" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "The docking station is full" if full?
    @bikes << bike
  end

private
  def full?
  	@bikes.count >= DEFAULT_CAPACITY
  	end
  def empty?
  	@bikes.count == 0
    end
end
