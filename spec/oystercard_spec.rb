require 'oystercard'

describe Oystercard do
  let(:entry_station){ double :station }
  let(:exit_station){ double :exit_station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '#balance' do
    it 'has default balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'allows the user to top up balance' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
  
    it 'has maximum balance limit of £90' do
      subject.top_up(Oystercard::BALANCE_LIMIT)
      expect {subject.top_up(1)}.to raise_error "Limit exceeded #{Oystercard::BALANCE_LIMIT}"
    end
  end

  describe '#in_journey' do
    it 'starts the journay as false' do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#touch_in' do
    it 'has minimum balance amount of £1' do
      expect { subject.touch_in(entry_station) }.to raise_error "Please top up"
    end

    it 'sets the journey to true' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.in_journey).to eq true
    end

    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end
  
  describe '#touch_out' do                                               
    it 'sets the journey to false' do
      subject.touch_out(exit_station)
      expect(subject.in_journey).to eq false
    end

    it 'reduces the balance by minimum charge' do
      subject.top_up(30)
      subject.touch_in(entry_station)
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by -Oystercard::MINIMUM_CHARGE
    end

    it 'stores the exit station' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  end

  describe '#journey_history' do
    it 'is empty to begin with' do
      expect(subject.journey_history).to be_empty
    end

    it 'stores a journey to the journey history list' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_history).to include journey
    end
  end
end

# Use a hash to store one journey (set of an entry and exit stations)
# Write a test that checks that the card has an empty list of journeys by default
# Write a test that checks that touching in and out creates one journey
# Keep all code including tests DRY