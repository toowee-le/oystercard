class Oystercard
  attr_reader :balance, :in_journey

  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1
  MINIMUM_CHARGE = 4

  def initialize
    @balance = 0
    @in_journey = false
  end

  def touch_in
    fail "Please top up" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
  end

  def top_up(amount)
    fail "Limit exceeded #{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end