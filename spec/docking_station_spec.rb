# require "docking_station"

# describe DockingStation do
#   it "releases bike" do
#     expect(release_bike).to eq "Bike released"
#   end
# end

require "docking_station"

describe DockingStation do
  describe "release bike" do
  	it{should respond_to(:release_bike)}
  	it "releases a working bike" do
  	  bike = subject.release_bike
  	  expect(bike).to be_working
  	end
    it "raises an error when no bikes are available" do
      expect{subject.release_bike}.to raise_error
    end

    it 'is a class of Bike' do
      expect(subject.release_bike).to be_an_instance_of Bike
    end
  end

  describe "Docking" do
      it{should respond_to(:dock).with(1).argument}
  end

  describe "Bike" do
  	it "return docked bikes" do
	  	bike = Bike.new
	  	subject.dock(bike)
	    expect(subject.bike).to eq bike
	end
  end
end
