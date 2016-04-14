require 'van'

describe Van do
  it 'has storage capacity' do
    expect(subject.storage).to eq []
  end

  describe '#pick_up' do
    it 'responds to pick_up method' do
      expect(subject).to respond_to(:pick_up)
    end

    it 'picks up bikes from the dock' do
      bikedouble = double("bike")
      dockdouble = double("dock")
      allow(dockdouble).to receive(:broken_bikes) { [bikedouble] }
      subject.pick_up(dockdouble)
      expect(subject.storage).to eq [bikedouble]
    end
  end

  describe '#bikes_are_broken' do
    it 'tests if van respond to bikes are broken' do
      expect(subject).to respond_to(:bikes_are_broken)
    end
  end
end