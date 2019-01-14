class Oystercard

  attr_reader :balance, :limit
  LIMIT = 90

  def initialize
    @balance = 0
    @limit = LIMIT
  end

  def top_up(value)
    fail "This exceeds the £#{limit} limit" if limit_exceeded?(value)
    @balance += value
  end

  private

  def limit_exceeded?(value)
    balance + value > limit
  end

end
