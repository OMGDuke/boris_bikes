#require './lib/bike'
require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
    @capacity=capacity
	end

	def release_bike
		raise "All bikes taken" if empty?
		@bikes.pop
	end

	def dock bike
    raise "Full!" if full?
		@bikes << bike
	end
private
  def full?
   @bikes.length >= capacity
  end
  def empty?
   @bikes.empty?
  end

end

