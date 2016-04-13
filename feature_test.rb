require './lib/docking_station'
stn = DockingStation.new
20.times {stn.dock(Bike.new)}
