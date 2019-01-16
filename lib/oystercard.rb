require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeylog

  LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journeylog = JourneyLog.new
  end

  def top_up(value)
    limit_exceeded?(value)
    @balance += value
  end

  def touch_in(station)
    deduct(@journeylog.journeys.last.fare) unless @journeylog.journeys == []
    sufficient_funds?
    @journeylog.start_journey(station)
  end

  def touch_out(station)
    @journeylog.end_journey(station)
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def limit_exceeded?(value)
    fail "This exceeds the £#{LIMIT} limit" if balance + value > LIMIT
  end

  def sufficient_funds?
    fail "Can\'t start journey: insufficient funds" if balance <= MIN_BALANCE
  end

end
