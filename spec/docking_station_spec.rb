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

  end

