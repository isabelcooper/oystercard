class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "This exceeds the £90 limit" if limit_exceeded?(value)
    @balance += value
  end

  private

  def limit_exceeded?(value)
    balance + value > 90
  end

end
