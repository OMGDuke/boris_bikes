#require './lib/bike'
require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity, :broken_bikes

	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
    @capacity=capacity
    @broken_bikes = []
	end

	def release_bike
		raise "All bikes taken" if empty?
    raise "Bike Broken" if @bikes.last.broken?
    @bikes.pop
	 end

	def dock bike
    raise "Full!" if full?
		@bikes << bike
	end

  def broken_bike_finder
    @bikes.each {|x| broken_bikes << @bikes.push if x.broken?}
    broken_bikes
    broken_bikes = []
  end

private
  def full?
   @bikes.length >= capacity
  end
  def empty?
   @bikes.empty?
  end
end
