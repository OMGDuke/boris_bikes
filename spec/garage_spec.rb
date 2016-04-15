#accept broken bikes
#fix bikes
#return a list of fix bikes

#intake method takes in bikes, puts into broken bikes array
#fix method that fixes bikes and moves to fixed array

require 'garage'
describe Garage do
  # bike = double("bike")
  let(:bike) {double(:bike, broken: false)}
  let(:broken_bike) {double(:broken_bike, broken: true, bike_broken: true, fix: false)}

  it 'starts a garage with storage space for fixed bikes' do
    expect(subject.fixed_bikes).to eq []
  end
  it 'starts a garage with a storage space for broken bikes' do
    expect(subject.garage_broken_bikes).to eq []
  end
  describe '#fix_bikes' do
    it 'can intake broken bikes' do
      subject.intake([broken_bike,broken_bike])
      expect(subject.garage_broken_bikes).to eq [broken_bike, broken_bike]
    end

  end
end
