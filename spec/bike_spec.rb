require 'bike'

describe Bike do
  it { is_expected.to respond_to :broken?}
  it 'Bike should initiate not broken' do
    expect(subject.broken?).to eq false
  end
  it 'bike should be able to be reported broken' do
    subject.bike_broken
    expect(subject.broken?).to eq true
  end

  describe '#fix' do
    it 'fixes the bike' do
      bike = Bike.new
      bike.bike_broken
      bike.fix
      expect(bike.broken?).to eq false
    end
  end
end

