class Oystercard
  attr_reader :balance, :entry_station, :exit_station, :journey_history

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1
  MINIMUM_CHARGE = 4

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def in_journey
    return true if @entry_station
    return false
  end

  def touch_in(station)
    fail "Please top up" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @exit_station = exit_station
  end

  def top_up(amount)
    fail "Limit exceeded #{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end