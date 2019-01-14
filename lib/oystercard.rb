class Oystercard

  attr_reader :balance, :limit
  LIMIT = 90

  def initialize
    @balance = 0
    @limit = LIMIT
    @in_journey = false
  end

  def top_up(value)
    fail "This exceeds the £#{limit} limit" if limit_exceeded?(value)
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def limit_exceeded?(value)
    balance + value > limit
  end

end
