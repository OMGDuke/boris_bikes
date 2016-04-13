  require 'docking_station'
  describe DockingStation do

    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    # it "return true or false when called on bike" do
    # expect(subject).to respond_to :release_bike
    it { is_expected.to respond_to :release_bike }

     #'docks method excepts one argument' do
    it { is_expected.to respond_to(:dock).with(1).argument}

    it 'allows a user to see a docked bike' do
      station = DockingStation.new
      bike = station.release_bike
      docked_bike = station.dock(bike)
      expect(station.bike).to eq docked_bike
    end

    it 'gives an error message when more than 50 bikes are released' do
      station =DockingStation.new
    expect { 100.times do station.release_bike end }.to raise_error("All bikes taken")
    end

  end

