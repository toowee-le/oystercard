require 'station'

describe Station do
  it 'initialises with a station name' do
    expect(subject.name).to eq nil
  end

  it 'initialises with a zone' do
    expect(subject.zone).to eq nil
  end
end