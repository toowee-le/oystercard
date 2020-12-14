require 'oystercard'

describe Oystercard do
  it 'has a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'allow the user to top up balance' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it 'has maximum limit of £90' do
    subject.top_up(Oystercard::BALANCE_LIMIT)
    expect {subject.top_up(1)}.to raise_error "Limit exceeded #{Oystercard::BALANCE_LIMIT}"
  end
end