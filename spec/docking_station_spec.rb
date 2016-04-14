  require 'docking_station'
  describe DockingStation do

    let(:bike) { Bike.new }
    let(:station) { DockingStation.new}
    let(:docked_bike) { station.dock(bike) }
    let(:capacity) { DockingStation::DEFAULT_CAPACITY }
    let(:bikedouble_working) {double("bike", broken?: false)}
    let(:bikedouble_broken) {double("bike", broken?: true)}

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'has a storage system for broken bikes' do
      expect(subject.broken_bikes).to eq []
    end

    describe '#release_bike' do
      it 'releases a bike' do
        subject.dock(bikedouble_working)
        expect(subject.release_bike).to eq bikedouble_working
      end

      it 'releases working bikes' do
        expect(bikedouble_working).to_not be_broken
      end

      it 'bike is broken raise error "Bike Broken"' do
        subject.dock(bikedouble_broken)
        expect{subject.release_bike}.to raise_error("Bike Broken")
      end

      it 'gives an error message when there is no bike' do
        expect { station.release_bike }.to raise_error("All bikes taken")
      end
    end

    describe '#bikes' do
      it 'allows a user to see a docked bike' do
        subject.dock(bikedouble_working)
        expect(subject.bikes).to eq [bikedouble_working]
      end
    end

    describe '#dock(bike)' do
      it 'docks bikes even if they are broken' do
        subject.dock(bikedouble_broken)
        expect(subject.bikes).to eq [bikedouble_broken]
      end
      it 'gives an error message there are no spaces to dock' do
        capacity.times { station.dock(bikedouble_working) }
        expect { station.dock(bikedouble_working) }.to raise_error("Full!")
      end
      it 'capacity can be set and an error raised when capacity is full' do
        docking = DockingStation.new(10)
        10.times do docking.dock(bikedouble_working) end
        expect { docking.dock(bikedouble_working) }.to raise_error("Full!")
      end
    end

    describe '#broken_bike_finder' do
      it 'responds to broken bike finder' do
        expect(subject).to respond_to(:broken_bike_finder)
      end

      it 'stores broken bikes in broken bikes array' do
        subject.dock(bikedouble_broken)
        subject.broken_bike_finder
        expect(subject.broken_bikes).to eq [bikedouble_broken]
      end
    end




  end


    # it {is_expected.to respond_to(:station).with(instance_of(Fixnum))}



