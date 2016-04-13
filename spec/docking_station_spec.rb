  require 'docking_station'
  describe DockingStation do

    let(:bike) { Bike.new }
    let(:station) { DockingStation.new }
    let(:docked_bike) { station.dock(bike) }
    let(:capacity) { DockingStation::DEFAULT_CAPACITY }

    describe '#release_bike' do
      it 'releases a bike' do
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end

      it 'releases working bikes' do
        expect(bike).to be_working
      end
    end

    it 'allows a user to see a docked bike' do
      expect(station.bikes).to eq docked_bike
    end

    it 'gives an error message when there is no bike' do
      expect { station.release_bike }.to raise_error("All bikes taken")
    end
    it 'gives an error message there are no spaces to dock' do
      capacity.times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error("Full!")
    end

  end

