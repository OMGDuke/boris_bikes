#require './lib/bike'
require_relative 'bike'

class DockingStation

	attr_reader :bike

	def release_bike
		raise "All bikes taken" unless @bike
		@bike
	end

	def dock bike
    raise "Full!" if @bike
		@bike = bike
	end
end

