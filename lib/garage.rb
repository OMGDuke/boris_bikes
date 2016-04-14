class Garage
  attr_accessor :fixed_bikes, :garage_broken_bikes
  def initialize
    @fixed_bikes =[]
    @garage_broken_bikes = []
  end

  def fix_bikes
    garage_broken_bikes.each {|x| x.fix }
    until garage_broken_bikes.empty? do
      fixed_bikes << garage_broken_bikes.pop
    end
  end
end