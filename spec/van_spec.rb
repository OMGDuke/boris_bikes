require 'van'

describe Van do
  it "has a capacity of 5 bikes" do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
  end

  it "can travel between the Garage and Docking Station" do
    subject.travel
    expect(subject.location).to eq "Docking Station"
  end

  let(:bike) {double :bike}
  let(:broken_bike) { double(:broken_bike, broken: true, bike_broken: true)}
  let(:stn) {double :stn}
  let(:garage) {double :garage}

    describe "#accept" do
      it "accepts a bike" do
        subject.accept([bike])
        expect(subject.bikes).to eq [bike]
      end

      it "accepts broken bikes from Docking Stations" do
        allow(stn).to receive(:broken_bike_finder).and_return(bike)
        subject.travel
        broken = stn.broken_bike_finder
        subject.accept([broken])
        expect(subject.bikes).to eq [bike]
      end

      it "accepts fixed bikes from the garage" do
        allow(garage).to receive(:fixed_bikes).and_return(bike)
        fixed = garage.fixed_bikes
        subject.accept([fixed])
        expect(subject.bikes).to eq [bike]
      end

      it "raises an error if there are more than 5 bikes to collect" do
        expect { subject.accept([bike,bike,bike,bike,bike,bike]) }.to raise_error "This van can only carry 5 bikes"
      end
    end

    describe "#release" do
      it "releases a bike" do
        subject.accept([bike])
        subject.travel
        expect(subject.release_bike).to eq [bike]
      end

      it "releases broken bikes at Garage" do
        allow(garage).to receive(:intake).and_return(bike)
        subject.accept([broken_bike])
        subject.accept([broken_bike])
        garage.intake(subject.release_bike)
        expect(subject.bikes).to eq []
      end

      it "docks fixed bikes at the Docking Station" do
        allow(stn).to receive(:dock).and_return(bike)
        subject.accept([bike])
        subject.accept([bike])
        subject.travel
        stn.dock(subject.release_bike)
        expect(subject.bikes).to eq []
      end
    end

end
