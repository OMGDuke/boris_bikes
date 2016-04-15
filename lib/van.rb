require_relative 'docking_station'
require_relative 'bike'
class Van
  attr_reader :storage

  def initialize
    @storage = []
  end
  def pick_up(dock)
    @storage += (dock.broken_bikes)
  end
  def bikes_are_broken
    true
  end

end