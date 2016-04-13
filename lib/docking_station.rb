#require './lib/bike'
require_relative 'bike'

class DockingStation

	attr_reader :bike

	def initialize
		@bike_count = 0
	end

	def release_bike
		@bike_count += 1
		raise "All bikes taken" if @bike_count >= 50
		return Bike.new
	end

	def dock bike
		@bike = bike
	end
end

