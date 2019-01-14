class Oystercard

  attr_reader :balance, :limit
  LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @limit = LIMIT
    @in_journey = false
    @min_balance = MIN_BALANCE
  end

  def top_up(value)
    limit_exceeded?(value)
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    sufficient_funds?
    @in_journey = true
  end

  def touch_out(fare)
    fail "Can\'t touch out without touching in first" if !in_journey?
    deduct(fare)
    @in_journey = false
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def limit_exceeded?(value)
    fail "This exceeds the £#{limit} limit" if balance + value > limit
  end

  def sufficient_funds?
    fail "Can\'t start journey: insufficient funds" if balance <= @min_balance
  end

end
