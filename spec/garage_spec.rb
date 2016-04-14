require 'garage'
describe Garage do
  # bike = double("bike")
  it 'starts a garage with storage space for fixed bikes' do
    expect(subject.fixed_bikes).to eq []
  end
  it 'starts a garage with a storage space for broken bikes' do
    expect(subject.garage_broken_bikes).to eq []
  end
  describe 'fix_bikes' do
    it 'can move bikes' do
      bike=double("bike")
      subject.garage_broken_bikes=([bike])
      subject.fix_bikes
      expect(subject.fixed_bikes).to eq [bike]
    end

    it 'removes bikes from garage_broken_bikes' do
      bike=double("bike")
      subject.garage_broken_bikes=([bike])
      expect(subject.fix).to eq true
      subject.fix_bikes
      expect(subject.garage_broken_bikes).to eq []
    end

    it 'fixes the bikes that it moves' do
      bike = Bike.new
      bike.bike_broken
      subject.garage_broken_bikes=([bike])
      subject.fix_bikes
      subject.fixed_bikes.each do |x|
        expect(x.broken?).to eq false
      end
    end
  end
end