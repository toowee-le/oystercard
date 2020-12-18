require 'station'

describe Station do
  it 'initialises with a station name' do
    station = "Angel"
    expect(subject.name(station)).to eq station
  end

  it 'initialises with a zone' do
    zone = 1
    expect(subject.zone(zone)).to eq zone
  end
end