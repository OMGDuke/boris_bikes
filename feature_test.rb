require './lib/van.rb'
require './lib/garage.rb'
require './lib/bike.rb'
require './lib/docking_station.rb'

bike1 = Bike.new
bike2 = Bike.new
bike3 = Bike.new
garage = Garage.new
stn = DockingStation.new
van = Van.new

bike1.bike_broken
bike2.bike_broken
stn.dock(bike1)
stn.dock(bike2)
stn.dock(bike3)

van.travel
van.accept(stn.broken_bike_finder)
stn.clear_broken
van.bikes
stn.bikes
