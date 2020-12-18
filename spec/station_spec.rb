require 'station'

describe Station do
  subject {described_class.new(name: nil, zone: nil)}

  it 'initialises with a station name' do
    expect(subject.name).to eq nil
  end

  it 'initialises with a zone' do
    expect(subject.zone).to eq nil
  end
end