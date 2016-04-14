class Bike
  def initialize
    @broken = false
  end

  def broken?
   @broken
  end

  def bike_broken
    @broken = true
  end

  def fix
    @broken = false
  end
end