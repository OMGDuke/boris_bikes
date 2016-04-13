require_relative 'Bike'
class DockingStation
  attr_reader :bike

  def release_bike
    raise "No bike available" unless @bike 
    @bike
  end

  def dock(bike)
    @bike = bike
  end
end
