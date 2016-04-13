require_relative 'Bike'
class DockingStation
	def initialize 
	  @bikes = []
	end

  attr_reader :bikes

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
  	@bikes.count >= 20
  	end
  def empty?
  	@bikes.count == 0
    end
end

