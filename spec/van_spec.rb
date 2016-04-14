require 'van'

describe Van do
  it "can carry up to 5 bikes" do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
  end
  it "can travel between the Garage and Docking Station" do
    subject.travel
    Van.location.should eq("Docking Station")
  end

  let(:bike) {double :bike}
    describe "#pickup" do
      it "picks up a bike" do
        allow(bike).to receive(:working?).and_return(true)
        subject.pickup(bike)
        expect(subject.bikes).to eq [bike]
      end

      it "only picks up broken bikes at the docking station" do
        allow(bike).to receive(:working?).and_return(true)
        subject.travel
        if bike.working? == true
          expect { subject.pickup(bike) }.to raise_error "Bike is not broken"
        end
      end

      it "only picks up working bikes at the garage" do
        allow(bike).to receive(:report_broken).and_return(false)
        allow(bike).to receive(:working?).and_return(false)
        bike.report_broken
        expect { subject.pickup(bike) }.to raise_error "Bike is broken"
      end
    end

    describe "#release" do
      it "releases a bike" do
        allow(bike).to receive(:working?).and_return(true)
        subject.pickup(bike)
        subject.travel
        expect(subject.release_bike).to eq bike
      end

      it "only releases working bikes at the docking station" do
        allow(bike).to receive(:report_broken).and_return(false)
        subject.travel
        bike.report_broken
        expect { subject.release_bike}.to raise_error "Bike is broken"
      end

      it "only releases broken bikes at the garage" do
        allow(bike).to receive(:working?).and_return(false)
        subject.travel
        subject.pickup(bike)
        allow(bike).to receive(:working?).and_return(true)
        subject.travel
        expect { subject.release_bike }.to raise_error "Bike is working"
      end
    end
end
