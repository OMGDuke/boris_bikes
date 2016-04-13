#require './lib/bike'
require_relative 'bike'

class DockingStation

	attr_reader :bikes

	def initialize
		@bikes = []
	end

	def release_bike
		raise "All bikes taken" unless @bikes.any?
		@bikes.pop
	end

	def dock bike
    raise "Full!" if @bikes.length >= 20
		@bikes << bike
	end
end

